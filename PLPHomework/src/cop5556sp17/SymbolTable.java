package cop5556sp17;



import java.util.ArrayList;

import cop5556sp17.AST.Dec;


public class SymbolTable {
	
	
	//TODO  add fields
	private int scopenum;
	
	public class unit{
		int scopenum;
		Dec dec;
		String id;
		
		public unit(int scopenum, Dec dec, String id)
		{
			this.scopenum=scopenum;
			this.dec=dec;
			this.id=id;
		}
		
		public int getscopenum()
		{
			return this.scopenum;
		}
		
		public Dec getdec()
		{
			return this.dec;
		}
		public String getid()
		{
			return this.id;
		}
	}
	
	private  ArrayList<ArrayList<unit>> lst = new ArrayList<ArrayList<unit>>();
	
	/** 
	 * to be called when block entered
	 */
	public void enterScope(){
		//TODO:  IMPLEMENT THIS
		this.scopenum++;
	}
	
	
	/**
	 * leaves scope
	 */
	public void leaveScope(){
		//TODO:  IMPLEMENT THIS
		this.scopenum--;
		int len_out=lst.size(),temp=0;
		while(temp<len_out)
		{
			//System.out.println(temp);
			//System.out.println(len_out);
			if (lst.get(temp).get(lst.get(temp).size()-1).getscopenum()>this.scopenum)
			{	
				lst.get(temp).remove(lst.get(temp).size()-1);
				if (lst.get(temp).size()==0)
				{
					lst.remove(temp);
					temp--;
					len_out--;
				}
			}
			temp++;
		}
	}
	
	public boolean insert(String ident, Dec dec){
		//TODO:  IMPLEMENT THIS
		int len_out=lst.size(),temp=0;
		while(temp<len_out)
		{
			if(lst.get(temp).get(0).getid().equals(ident))
			{
				//System.out.println(lst.get(temp).get(lst.get(temp).size()-1).getscopenum());
				//System.out.println(this.scopenum);
				if(lst.get(temp).get(lst.get(temp).size()-1).getscopenum()>=this.scopenum)
					return false;
				else
				{
					lst.get(temp).add(new unit(this.scopenum,dec,ident));
					temp=len_out+1;
				}
			}
			else temp++;
		}
		if (temp==len_out)
		{
			lst.add(new ArrayList<unit>());
			lst.get(temp).add(new unit(this.scopenum,dec,ident));
		}
		//throw new TypeCheckException("redeclare");
		return true;
	}
	
	public Dec lookup(String ident){
		//TODO:  IMPLEMENT THIS
		int len_out=lst.size(),temp=0;
		while (temp<len_out)
		{
			//System.out.println(lst.get(temp).get(0).getid());
			if (lst.get(temp).get(0).getid().equals(ident))
			{
				return lst.get(temp).get(lst.get(temp).size()-1).getdec();
			}
			temp++;
		}
		return null;
	}
		
	public SymbolTable() {
		//TODO:  IMPLEMENT THIS
	}


	@Override
	public String toString() {
		//TODO:  IMPLEMENT THIS
		return "";
	}
	
	public void init_scopenum(){
		this.scopenum=0;
	}
	
	


}
