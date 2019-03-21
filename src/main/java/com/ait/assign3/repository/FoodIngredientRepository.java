package com.ait.assign3.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.ait.assign3.DbManager;
import com.ait.assign3.model.FoodIngredient;

public class FoodIngredientRepository {

	public FoodIngredientRepository() {

		// TODO Auto-generated constructor stub
	}

	public void save(FoodIngredient foodIngredient) {
		DbManager db = new DbManager();
		Connection conn = db.getConnection();

		PreparedStatement stat;
		try {
			conn = new DbManager().getConnection();

			stat = conn.prepareStatement("insert into food_ingredient ( name,unit,code,food_id) values (?, ?, ?, ?)");

			stat.setString(1, foodIngredient.getName());
			stat.setInt(2, foodIngredient.getUnit());
			stat.setString(3, foodIngredient.getCode());
			stat.setInt(4, foodIngredient.getFood_id());

			stat.executeUpdate();

			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.close();
		}
	}

	public ArrayList<FoodIngredient> findAllByFoodId(int id) {
		PreparedStatement ps = null;
		ResultSet rs = null;

		DbManager db = new DbManager();
		Connection conn = db.getConnection();

		ArrayList<FoodIngredient> foodIngredientList = new ArrayList<FoodIngredient>();

		try {
			ps = conn.prepareStatement("SELECT id, name,unit,code,food_id FROM food_ingredient where food_id = ?");
			ps.setInt(1, id);

			rs = ps.executeQuery();

			System.out.println("111111111111");
			while (rs.next()) {

				FoodIngredient foodIngredient = new FoodIngredient();

				foodIngredient.setId(rs.getInt("id"));
				foodIngredient.setName(rs.getString("name"));
				foodIngredient.setUnit(rs.getInt("unit"));
				foodIngredient.setCode(rs.getString("code"));
				foodIngredient.setFood_id(rs.getInt("food_id"));

				foodIngredientList.add(foodIngredient);

			}
			System.out.println("2222222222");

			conn.close();
			return foodIngredientList;

		} catch (

		SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.close();
		}
		return null;
	}

	public void delete(int id) {
		DbManager db = new DbManager();
		Connection conn = db.getConnection();

		PreparedStatement stat;
		try {
			conn = new DbManager().getConnection();

			stat = conn.prepareStatement("DELETE FROM food_ingredient WHERE ID = ?");
			stat.setInt(1, id);

			stat.executeUpdate();

			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.close();

		}
	}
}
