package com.ait.assign3.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.ait.assign3.DbManager;
import com.ait.assign3.model.Food;
import com.ait.assign3.model.FoodIngredient;
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
			ps = conn.prepareStatement("select id, code,name from ingredient");

			rs = ps.executeQuery();

			System.out.println("111111111111");
			while (rs.next()) {

				Ingredient ingredient = new Ingredient();

				ingredient.setId(rs.getInt("id"));
				ingredient.setCode(rs.getString("code"));
				ingredient.setName(rs.getString("name"));


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

	public Ingredient findOneById(int id) {
		PreparedStatement ps = null;
		ResultSet rs = null;

		DbManager db = new DbManager();
		Connection conn = db.getConnection();

		try {
			ps = conn.prepareStatement("SELECT id, code ,name FROM ingredient where id = ?  limit 1");
			ps.setInt(1, id);

			rs = ps.executeQuery();

			if (rs != null && rs.next()) {

				Ingredient ingredient = new Ingredient();

				ingredient.setId(rs.getInt("id"));
				ingredient.setCode(rs.getString("code"));
				ingredient.setName(rs.getString("name"));

				// memo.setDateCreate(rs.getDate("dateCreate"));
				// memo.setDateUpdate(rs.getDate("dateUpdate"));
				conn.close();
				return ingredient;

			} else {
				conn.close();
				return null;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.close();
		}
		return null;
	}
	public Ingredient findOneByCode(String code) {
		PreparedStatement ps = null;
		ResultSet rs = null;

		DbManager db = new DbManager();
		Connection conn = db.getConnection();

		try {
			ps = conn.prepareStatement("SELECT id, code ,name FROM ingredient where code = ?  limit 1");
			ps.setString(1, code);

			rs = ps.executeQuery();

			if (rs != null && rs.next()) {

				Ingredient ingredient = new Ingredient();

				ingredient.setId(rs.getInt("id"));
				ingredient.setCode(rs.getString("code"));
				ingredient.setName(rs.getString("name"));

				// memo.setDateCreate(rs.getDate("dateCreate"));
				// memo.setDateUpdate(rs.getDate("dateUpdate"));
				conn.close();
				return ingredient;

			} else {
				conn.close();
				return null;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.close();
		}
		return null;
	}
}
