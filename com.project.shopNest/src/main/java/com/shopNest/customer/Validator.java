package com.shopNest.customer;

import com.shopNest.db.DataFetcher;

public class Validator {

	public static boolean isValid(String uname, String pass) {
			String dbPass=DataFetcher.fetchPassword(uname);
			if(pass.equals(dbPass)) {
				return true;
			}
			else {
				return false;
			}
	}
}
