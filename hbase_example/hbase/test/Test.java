package my.hbase.test;

public class Test {
	//private static HbaseUtileTest hbaseUtileTest;
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String tablename="lb";
		String [] cfs = new String [] {"info"};
		String [] quals = new String [] {"name","age","sex"};
		String [] value = new String [] {"linbing","22","girl"};
		HbaseUtileTest hbaseUtileTest = new HbaseUtileTest();
		if (hbaseUtileTest.checkTable(tablename) == false)
		{	
			hbaseUtileTest.createTable(tablename,cfs);
		}
		
		hbaseUtileTest.insertData(tablename, "key", cfs[0], quals, value);
	//	hbaseUtileTest.insertData(tablename, "k1", cfName, quals, value);
		//hbaseUtileTest.deleteTable(tablename);
		System.out.println("----------------yes ---------");
		//		 String cfs[] = new String[]{"info"};
		//		 for(String cf:cfs)
		//		 {
		//			 
		//		 }
	
	}

}
