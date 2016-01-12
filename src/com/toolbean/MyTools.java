package com.toolbean;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * 
 * @author happyling
 *
 *完成基本数据处理功能，比如中文乱码处理，MD5，数据类型转换
 */
public class MyTools {
	/**
	 * 
	 * @param str
	 * @return
	 */
	public static int strToint(String str){
		if(str==null || str.equals(""))
			str="0";
		int i=0;
		
		try{
			i=Integer.parseInt(str);
		}catch(NumberFormatException e){
			i=0;
			e.printStackTrace();
		}
		return i;
	}
	/**
	 * 
	 * @param str
	 * @return
	 */
	public static double strTodouble(String str){
		if(str==null || str.equals(""))
			str="0";
		double i=0;
		
		try{
			i=Double.parseDouble(str);
		}catch(NumberFormatException e){
			i=0;
			e.printStackTrace();
		}
		return i;
	}
	/**
	 * 
	 * @param str
	 * @return
	 */
	public static String toChiness(String str){
		if(str==null)
			str="";
		
		try{
			str=new String(str.getBytes("ISO-8859-1"),"UTF-8");
		}catch(UnsupportedEncodingException e){
			str="";
			e.printStackTrace();
		}
		return str;
	}
	/**
	 * 计算MD5散列值计算
	 * @param str	需要计算的字符串
	 * @return	参数 str 对应的 MD5 散列值
	 */
	public static String getMD5(String str){
		
		MessageDigest m;
		String retString="";
		try {
			m = MessageDigest.getInstance("MD5");
			m.update(str.getBytes( ));
			byte s[ ]=m.digest( );
			for (int i=0; i<s.length; i++){
				retString += Integer.toHexString((0x000000ff & s[i]) | 0xffffff00).substring(6);				
			}  
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return retString;
	}

}
