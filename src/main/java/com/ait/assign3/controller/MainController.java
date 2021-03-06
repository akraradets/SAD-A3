package com.ait.assign3.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.validation.Valid;

import org.apache.commons.io.FilenameUtils;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.ait.assign3.model.Food;
import com.ait.assign3.model.FoodIngredient;
import com.ait.assign3.model.FoodIngredientMapper;
import com.ait.assign3.model.FoodMapper;
import com.ait.assign3.model.Ingredient;
import com.ait.assign3.model.IngredientObject;
import com.ait.assign3.model.ResponseObject;
import com.ait.assign3.repository.FoodIngredientRepository;
import com.ait.assign3.repository.FoodRepository;
import com.ait.assign3.repository.IngredientRepository;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.reflect.TypeToken;
import com.mysql.cj.ParseInfo;

@Controller
public class MainController {

	FoodIngredientRepository foodIngredientRepository;
	FoodRepository foodRepository;
	IngredientRepository ingredientRepository;
	private static String UPLOADED_FOLDER = "D://temp//";

	// return first page that list food
	@RequestMapping("/")
	public String index(Model model) {
		foodRepository = new FoodRepository();

		// Memo memo = memoRepository.findOneById(1);
		ArrayList<Food> list = foodRepository.findAll();
		model.addAttribute("foods", list);
		// this is jsp file name
		return "index";
	}

	// when click create new food
	@RequestMapping("/formFood")
	public String formPage(Model model) {
		model.addAttribute("foodMapper", new FoodMapper());

		return "food_form";
	}

	// click create new food button, it will return the detail food page with
	// list
	// of ingredient
	@RequestMapping(value = "/addFood", method = RequestMethod.POST)
	public String submitFood(
			@Valid @ModelAttribute("foodMapper") FoodMapper foodMapper,
			BindingResult result, ModelMap model) {
		if (result.hasErrors()) {
			return "error";
		}

		// declare variable for compose filename
		UUID uuid = UUID.randomUUID();
		String filePath = "";
		String fileName = "";
		MultipartFile file = foodMapper.getFile();
		if (!file.isEmpty()) {

			try {
				// compose file name
				fileName = uuid.toString()
						+ "."
						+ FilenameUtils
								.getExtension(file.getOriginalFilename());
				filePath = UPLOADED_FOLDER + fileName;
				// Get the file and save it somewhere
				byte[] bytes = file.getBytes();
				Path path = Paths.get(filePath);
				Files.write(path, bytes);

			} catch (IOException e) {
				e.printStackTrace();
			}

		}

		Food food = new Food();
		food.setName(foodMapper.getName());
		food.setDescription(foodMapper.getDescription());
		food.setImage_path(fileName);

		foodRepository = new FoodRepository();
		int foodId = foodRepository.save(food);
		Food foodNew = foodRepository.findOneById(foodId);
		model.addAttribute("food", foodNew);

		foodIngredientRepository = new FoodIngredientRepository();
		ArrayList<FoodIngredient> listIn = foodIngredientRepository
				.findAllByFoodId(foodId);

		model.addAttribute("listIngre", listIn);

		return "food_detail";
	}

	@RequestMapping("/viewFood/{id}")
	public String viewFood(@PathVariable("id") int id, Model model) {
		foodRepository = new FoodRepository();

		// Memo memo = memoRepository.findOneById(1);
		Food food = foodRepository.findOneById(id);
		model.addAttribute("food", food);

		foodIngredientRepository = new FoodIngredientRepository();
		ArrayList<FoodIngredient> listIn = foodIngredientRepository
				.findAllByFoodId(food.getId());
		model.addAttribute("listIngre", listIn);

		// this is jsp file name
		return "food_detail";
	}

	@RequestMapping("/foodIngredient/{id}")
	public String addIngredient(@PathVariable("id") int id, Model model) {
		foodRepository = new FoodRepository();
		System.out.println("step >>>>X 1");
		FoodIngredient foodIngredient = new FoodIngredient();
		foodIngredient.setFood_id(id);
		// FoodIngredientMapper foodIngredientMapper = new
		// FoodIngredientMapper();
		// foodIngredientMapper.setFood_id(Integer.toString(id));

		ingredientRepository = new IngredientRepository();
		model.addAttribute("ingredients", ingredientRepository.findAll());

		model.addAttribute("foodIngre", foodIngredient);
		System.out.println("step >>>>X 2");
		// this is jsp file name
		return "ingre_form";
	}

	@RequestMapping(value = "/addIngredient", method = RequestMethod.POST)
	public String submitIngredient(
			@Valid @ModelAttribute("foodIngre") FoodIngredient foodIngredient,
			BindingResult result, ModelMap model) {
		System.out.println("step >>>>1");
		if (result.hasErrors()) {
			return "error";
		}

		ingredientRepository = new IngredientRepository();

		Ingredient ingredient = ingredientRepository.findOneByCode(foodIngredient.getCode());

		foodIngredient.setName(ingredient.getName());

		System.out.println("step >>>>2");
		foodRepository = new FoodRepository();
		Food foodNew = foodRepository.findOneById(foodIngredient.getFood_id());
		model.addAttribute("food", foodNew);

		System.out.println("step >>>>3");

		foodIngredientRepository = new FoodIngredientRepository();
		foodIngredientRepository.save(foodIngredient);
		System.out.println("step >>>>4");
		ArrayList<FoodIngredient> listIn = foodIngredientRepository
				.findAllByFoodId(foodIngredient.getFood_id());

		model.addAttribute("listIngre", listIn);
		System.out.println("step >>>>5");
		return "food_detail";
	}

	@RequestMapping("/delete/{id}")
	public String deleteFood(@PathVariable("id") int id, Model model) { // memoRepository
																		// = new
																		// MemoRepository();
																		// //

		foodRepository = new FoodRepository();
		foodRepository.delete(id); // return null;
		// Memo memo = memoRepository.findOneById(1);
		ArrayList<Food> list = foodRepository.findAll();
		model.addAttribute("foods", list);
		// this is jsp file name
		return "redirect:" + "/";
	}

	@RequestMapping("/deleteIngre/{id1}/{id2}")
	public String deleteIngre(@PathVariable("id1") int foodId,
			@PathVariable("id2") int ingreId, Model model) {
		// memoRepository = new MemoRepository(); //

		foodIngredientRepository = new FoodIngredientRepository();
		foodIngredientRepository.delete(ingreId); // return null
		;
		// Memo memo = memoRepository.findOneById(1);
		ArrayList<Food> list = foodRepository.findAll();
		model.addAttribute("foods", list);
		// this is jsp file name
		return "redirect:" + "/viewFood/" + foodId;
	}


	@RequestMapping("/getCal/{id}")
	public String getCal(@PathVariable("id") int id, Model model) throws Exception{
		ArrayList<IngredientObject> list = new ArrayList<IngredientObject>();

		foodIngredientRepository = new FoodIngredientRepository();

		ArrayList<FoodIngredient> listIn = foodIngredientRepository.findAllByFoodId(id);
		/*
		 * for (FoodIngredient foodIngredient : listIn) { IngredientObject
		 * ingredientObject = new IngredientObject();
		 * 
		 * ingredientObject.setCode(foodIngredient.getCode());
		 * ingredientObject.setUnit(ingredientObject.getUnit());
		 * 
		 * list.add(ingredientObject); }
		 */

		JSONArray jr = new JSONArray();
		for (FoodIngredient foodIngredient : listIn) {

			JSONObject obj = new JSONObject();
			obj.put("code", foodIngredient.getCode());
			obj.put("unit", foodIngredient.getUnit());
			jr.put(obj);

		}

		CloseableHttpClient httpClient = HttpClientBuilder.create().build();
		JSONArray jsArray = new JSONArray(jr.toString());
		System.out.println(jsArray.toString());
		// System.out.println(json);
		try {
			HttpPost request = new HttpPost("https://sad-assignment3.appspot.com/");
			StringEntity params = new StringEntity(jsArray.toString());
			request.addHeader("content-type", "application/json");
			request.setEntity(params);
			HttpResponse response = httpClient.execute(request);
			HttpEntity responseEntity = response.getEntity();
			String str = "";
			if (responseEntity != null) {
				str = EntityUtils.toString(responseEntity);
			}

			foodRepository = new FoodRepository();
			Food foodNew = foodRepository.findOneById(id);

			model.addAttribute("food", foodNew);

			Gson gson = new Gson();
			JsonParser parser = new JsonParser();
			JsonObject object = (JsonObject) parser.parse(str);// response will be the json String
			ResponseObject responseObject = gson.fromJson(object, ResponseObject.class);

			model.addAttribute("cal", responseObject.getCal());
			httpClient.close();
			return "cal_page";

			// handle response here...
		} catch (Exception ex) {
			// handle exception here
			ex.printStackTrace();
		} finally {

		}
		return null;

	}

//		return "food_detail";

}
