package mapReduceHbase1;

import java.io.IOException;
import java.net.URI;


import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.conf.Configured;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.HColumnDescriptor;
import org.apache.hadoop.hbase.HTableDescriptor;
import org.apache.hadoop.hbase.client.HBaseAdmin;
import org.apache.hadoop.hbase.client.Put;
import org.apache.hadoop.hbase.io.ImmutableBytesWritable;
import org.apache.hadoop.hbase.mapreduce.TableMapReduceUtil;
import org.apache.hadoop.hbase.mapreduce.TableReducer;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapred.JobConf;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Mapper.Context;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.input.TextInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;
import org.apache.hadoop.util.Tool;
import org.apache.log4j.Logger;
import org.mortbay.log.Log;

public class TestHbase extends Configured implements Tool{

	/**
	 * @param args
	 */
	public static String tab="testLog1"; 
	static Logger log = Logger.getLogger(TestHbase.class);
	public static class HbaseMapper extends Mapper<Object, Text, Text, IntWritable> 
	{
		private  IntWritable one = new IntWritable(1);
		@Override
		public void map(Object key, Text value, Context context) throws IOException, InterruptedException
		{
			String[] af=value.toString().split(" ");
			String dat=(af[0]);
			String time=(af[1]);
			String logl=(af[3]);
			String mod=(af[4]);
			String clz=(af[5]);
			String title=(af[7]);
			 String k=dat+"_"+time+"_"+title;
			 String v=logl+" "+mod+" "+clz;
			 context.write(new Text(k+"&&&"+v),  one);
			 Log.info(k+"&&&"+v+" in reducer");
		}
	}
	public static class HbaseReducer extends TableReducer<Text,Text,ImmutableBytesWritable>{
		@Override
		 public void reduce(Text key,Iterable<Text> values,Context context){
			 String ks=key.toString();
			 String k=ks.split("&&&")[0];
			 String v=ks.split("&&&")[1];
			 Put putrow = new Put(k.getBytes());
			 putrow.add("info".getBytes(), "text".getBytes(), v.getBytes());
			 Log.info(k+" has inserted");
			 try{
				 context.write(null, putrow);
			 }
			 catch (Exception e)
			 {
				 e.printStackTrace();
			 }
		 }
	}
	
	public int run(String[] args) throws Exception{
		// TODO Auto-generated method stub
		System.out.println(args.length);
		System.out.println(args[1]);
		System.out.println(args[2]);

		Configuration jobconf = HBaseConfiguration.create();
		HBaseAdmin hBaseAdmin = new HBaseAdmin(jobconf);
		if (!hBaseAdmin.tableExists(tab))
		{
			HTableDescriptor tableDescriptor = new HTableDescriptor(tab);
			tableDescriptor.addFamily(new HColumnDescriptor("info"));
			hBaseAdmin.createTable(tableDescriptor);
			Log.info("create table success");
		}
	 
		 Job job = new Job(jobconf, "HBase test");
		 job.setJarByClass(TestHbase.class);
		 job.setJar("/root/mr3.jar");
		 
			job.setInputFormatClass(TextInputFormat.class);
			FileInputFormat.addInputPath(job, new Path(args[1]));
			
		 job.setJarByClass(TestHbase.class);
		    job.setMapperClass(HbaseMapper.class);
//		    job.setReducerClass(HbaseReducer.class);
		    job.setInputFormatClass(TextInputFormat.class);
		    job.setMapOutputKeyClass(Text.class);
		    job.setMapOutputValueClass(IntWritable.class);
		    job.setOutputKeyClass(Text.class);
		    job.setOutputValueClass(Text.class);
		    FileInputFormat.addInputPath(job, new Path(args[1]));
		    FileOutputFormat.setOutputPath(job,new Path(args[2]));
		    
		    TableMapReduceUtil.initTableReducerJob(tab, HbaseReducer.class, job);
		    TableMapReduceUtil.addHBaseDependencyJars(jobconf);
		   return job.waitForCompletion(true) ? 0 : 1;


	}
	public static void main(String [] args) throws Exception{

		new TestHbase().run(args); 

    } 

}
