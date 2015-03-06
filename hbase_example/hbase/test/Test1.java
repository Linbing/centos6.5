package my.hbase.test;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.HColumnDescriptor;
import org.apache.hadoop.hbase.HTableDescriptor;
import org.apache.hadoop.hbase.client.Admin;
import org.apache.hadoop.hbase.client.HBaseAdmin;
import org.apache.hadoop.hbase.client.HTable;
import org.apache.hadoop.hbase.client.Put;


public class Test1 {
	
	private static Configuration config;
	private static HBaseAdmin hBaseAdmin;
	static
	{
		config=HBaseConfiguration.create();
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		System.out.println(config.getClassLoader());
		String cfs = new String("name");
		try {
			hBaseAdmin = new HBaseAdmin(config);
			if(hBaseAdmin.tableExists("linbing")==true)
			{
				System.out.println("-------yes is exist --------");
			}
			else
			{
				HTableDescriptor tableDescriptor = new HTableDescriptor("linbing");

				
				tableDescriptor.addFamily(new HColumnDescriptor(cfs));

				hBaseAdmin.createTable(tableDescriptor);
				hBaseAdmin.close();
			}
			
			
			try
			{
				HTable table = new HTable(config, "linbing");
				String key="k";
				String quals = "age";
				String value = "28";
				Put put = new Put(key.getBytes());
			//	for (int i=0; i<cfs.length;i++)
				//{
				put.add(cfs.getBytes(), quals.getBytes(), value.getBytes());
				table.put(put);
				table.close();
				//}
				
			}catch(Exception e)
			{
				System.out.println("hbase inster error " +e);
			}
			
			
		}catch (Exception e)
		 {
			System.out.println("hbase init error " +e);
		 }
		finally{
		}
		
		
			
	}

}
