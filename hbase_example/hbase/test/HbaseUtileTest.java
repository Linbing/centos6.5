package my.hbase.test;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.HColumnDescriptor;
import org.apache.hadoop.hbase.HTableDescriptor;
import org.apache.hadoop.hbase.client.HBaseAdmin;
import org.apache.hadoop.hbase.client.HTable;
import org.apache.hadoop.hbase.client.Put;
import org.apache.log4j.Logger;

import util.HbaseUtil;

public class HbaseUtileTest {
	private static Configuration configuration;
	private static HBaseAdmin hBaseAdmin;
	private static Logger log = Logger.getLogger(HbaseUtil.class);
	static 
	{
		configuration = HBaseConfiguration.create();
	}
	
	public void init()
	{
		try
		{
			hBaseAdmin = new HBaseAdmin(configuration);
		}catch(Exception e)
		{
			log.error("hbase init error"+e);
		}
	}
	
	public HBaseAdmin getAdmin()
	{
		if (hBaseAdmin == null)
			init();
		return hBaseAdmin;
	}
	public boolean checkTable(String tableName) 
	{
		boolean ifExists = false;
		try
		{
			 ifExists = getAdmin().tableExists(tableName);
		}catch (Exception e)
		{
			log.error(" check table error "+e);
		}
		
		return ifExists;
	}
	
	
	public void createTable(String tablename,String [] cfs)
	{
		try
		{
			HTableDescriptor tableDescriptor = new HTableDescriptor(tablename);
			for(String cf:cfs)
			{
				tableDescriptor.addFamily(new HColumnDescriptor(cf));
			}
			getAdmin().createTable(tableDescriptor);
			log.info(" hbase create talbe ok "+tablename);
			//hBaseAdmin.createTable(tableDescriptor);
			
		}catch(Exception e)
		{
			log.error(" create table failed "+e);
		}
	}
	
	public void deleteTable(String tablename)
	{
		try
		{	
			HBaseAdmin Admin=getAdmin();
			if (Admin.tableExists(tablename) == true)
			{
				Admin.disableTable(tablename);
				Admin.deleteTable(tablename);
				log.info("hbase delete table "+tablename);
			}
		}catch (Exception e)
		{
			log.error(" delete table failed "+e);
		}
	}
	//public insertData
	public void insertData(String tableName,String key,String cfName,String[] quals,String[] value)
	{
		try
		{
			HTable hTable = new HTable(configuration, tableName);
			Put put = new Put(key.getBytes());
			for (int i=0; i<quals.length;i++)
			{
				put.add(cfName.getBytes(),quals[i].getBytes(),value[i].getBytes());
			}
			hTable.put(put);
			hTable.close();
			log.info("hbase insert ok "+tableName );
			
		}catch(Exception e)
		{
			log.error("hbase insert error "+tableName+" " +e);
		}
		
		
	}
	
}
