package com.ait.assign3.controller;

import java.util.ArrayList;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ait.assign3.model.Food;
import com.ait.assign3.model.FoodIngredient;
import com.ait.assign3.model.FoodIngredientMapper;
import com.ait.assign3.repository.FoodIngredientRepository;
import com.ait.assign3.repository.FoodRepository;
import com.ait.assign3.repository.IngredientRepository;
import com.mysql.cj.ParseInfo;

@Controller
public class MainController {

	FoodIngredientRepository foodIngredientRepository;
	FoodRepository foodRepository;
	IngredientRepository ingredientRepository;

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
		model.addAttribute("food", new Food());

		return "food_form";
	}

	// click create new food button, it will return the detail food page with list
	// of ingredient
	@RequestMapping(value = "/addFood", method = RequestMethod.POST)
	public String submitFood(@Valid @ModelAttribute("food") Food food, BindingResult result, ModelMap model) {
		if (result.hasErrors()) {
			return "error";
		}

		foodRepository = new FoodRepository();
		int foodId = foodRepository.save(food);
		Food foodNew = foodRepository.findOneById(foodId);
		model.addAttribute("food", foodNew);

		foodIngredientRepository = new FoodIngredientRepository();
		ArrayList<FoodIngredient> listIn = foodIngredientRepository.findAllByFoodId(foodId);

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
		ArrayList<FoodIngredient> listIn = foodIngredientRepository.findAllByFoodId(food.getId());
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
		//FoodIngredientMapper foodIngredientMapper = new FoodIngredientMapper();
		//foodIngredientMapper.setFood_id(Integer.toString(id));
		
		model.addAttribute("foodIngre", foodIngredient);
		System.out.println("step >>>>X 2");
		// this is jsp file name
		return "ingre_form";
	}

	@RequestMapping(value = "/addIngredient", method = RequestMethod.POST)
	public String submitIngredient(@Valid @ModelAttribute("foodIngre") FoodIngredient foodIngredient, BindingResult result, ModelMap model) {
		System.out.println("step >>>>1");
		if (result.hasErrors()) {
			return "error";
		}
		
		//FoodIngredient foodIngredient = new FoodIngredient();
		//foodIngredient.setName(foodIngredientMapper.getName());
		//foodIngredient.setUnit(Integer.parseInt(foodIngredientMapper.getUnit())	);
		//foodIngredient.setUnit(Integer.parseInt(foodIngredientMapper.getFood_id()));
		//foodIngredient.setCode(foodIngredientMapper.getCode());
		
		System.out.println("step >>>>2");
		foodRepository = new FoodRepository();
		Food foodNew = foodRepository.findOneById(foodIngredient.getFood_id());
		model.addAttribute("food", foodNew);
		
		System.out.println("step >>>>3");
		
		foodIngredientRepository = new FoodIngredientRepository();
		foodIngredientRepository.save(foodIngredient);
		System.out.println("step >>>>4");
		ArrayList<FoodIngredient> listIn = foodIngredientRepository.findAllByFoodId(foodIngredient.getFood_id());

		model.addAttribute("listIngre", listIn);
		System.out.println("step >>>>5");
		return "food_detail";
	}
/*
	@RequestMapping("/delete/{id}")
	public String index(@PathVariable("id") int id, Model model) {
		// memoRepository = new MemoRepository();
		// memoRepository.delete(id);
		//
		return null;
		
	}*/

}
