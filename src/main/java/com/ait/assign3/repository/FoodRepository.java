package com.ait.assign3.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.ait.assign3.DbManager;
import com.ait.assign3.model.Food;

public class FoodRepository {

	public FoodRepository() {

	}

	public int save(Food food) {
		//return 0 if insert fail
		//return id of the food if insert success
		DbManager db = new DbManager();
		Connection conn = db.getConnection();
		int id;

		PreparedStatement stat;
		try {
			conn = new DbManager().getConnection();

			stat = conn.prepareStatement("insert into food( name,description,image_path) values (?, ?, ?)",  Statement.RETURN_GENERATED_KEYS);

			stat.setString(1, food.getName());
			stat.setString(2, food.getDescription());
			stat.setString(3, food.getImage_path());


			int affectedRows = stat.executeUpdate();
			System.out.println(">>>>>>>>>>>>>>1 : "+affectedRows);
			if (affectedRows == 0) {
				throw new SQLException("Creating user failed, no rows affected.");
			}

			try (ResultSet generatedKeys = stat.getGeneratedKeys()) {
				if (generatedKeys.next()) {
					id = generatedKeys.getInt(1);
					System.out.println(">>>>>>>>>>>>>>2 : "+id);
				} else {
					throw new SQLException("Creating user failed, no ID obtained.");
				}
			}

			conn.close();
			return id;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		} finally {
			db.close();
		}
		return 0;
	}

	public ArrayList<Food> findAll() {
		PreparedStatement ps = null;
		ResultSet rs = null;

		DbManager db = new DbManager();
		Connection conn = db.getConnection();

		ArrayList<Food> foodList = new ArrayList<Food>();

		try {
			ps = conn.prepareStatement("select id, name, description,image_path from food");

			rs = ps.executeQuery();

			System.out.println("111111111111");
			while (rs.next()) {

				Food food = new Food();

				food.setId(rs.getInt("id"));
				food.setName(rs.getString("name"));
				food.setDescription(rs.getString("description"));
				food.setImage_path(rs.getString("image_path"));

				foodList.add(food);

			}
			System.out.println("2222222222");

			conn.close();
			return foodList;

		} catch (

		SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.close();
		}
		return null;
	}

	public Food findOneById(int id) {
		PreparedStatement ps = null;
		ResultSet rs = null;

		DbManager db = new DbManager();
		Connection conn = db.getConnection();

		try {
			ps = conn.prepareStatement("select id, name,  description, image_path from food where id =?  limit 1");
			ps.setInt(1, id);

			rs = ps.executeQuery();

			if (rs != null && rs.next()) {

				Food food = new Food();
				food.setId(rs.getInt("id"));
				food.setName(rs.getString("name"));
				food.setDescription(rs.getString("description"));
				food.setImage_path(rs.getString("image_path"));

				// memo.setDateCreate(rs.getDate("dateCreate"));
				// memo.setDateUpdate(rs.getDate("dateUpdate"));
				conn.close();
				return food;

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

	public void delete(int id) {
		DbManager db = new DbManager();
		Connection conn = db.getConnection();

		PreparedStatement stat;
		try {
			conn = new DbManager().getConnection();

			stat = conn.prepareStatement("DELETE FROM FOOD WHERE ID = ?");
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
