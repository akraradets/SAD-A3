package com.ait.assign3.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.ait.assign3.DbManager;
import com.ait.assign3.model.Ingredient;

public class IngredientRepository {

	public IngredientRepository() {

	}

	public ArrayList<Ingredient> findAll() {
		PreparedStatement ps = null;
		ResultSet rs = null;

		DbManager db = new DbManager();
		Connection conn = db.getConnection();

		ArrayList<Ingredient> ingredientList = new ArrayList<Ingredient>();

		try {
			ps = conn.prepareStatement("select id, name, code from food");

			rs = ps.executeQuery();

			System.out.println("111111111111");
			while (rs.next()) {

				Ingredient ingredient = new Ingredient();

				ingredient.setId(rs.getInt("id"));
				ingredient.setName(rs.getString("name"));
				ingredient.setCode(rs.getString("code"));

				ingredientList.add(ingredient);

			}
			System.out.println("2222222222");

			conn.close();
			return ingredientList;

		} catch (

		SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.close();
		}
		return null;
	}

}
