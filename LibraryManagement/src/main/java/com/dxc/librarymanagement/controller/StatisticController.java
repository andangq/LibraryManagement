package com.dxc.librarymanagement.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.dxc.librarymanagement.dao.LibBorrowBookDAO;

@RestController
public class StatisticController {
	@Autowired
	private LibBorrowBookDAO borrowdao;
	
	@RequestMapping(value= "/home/statistic/month/{year}")
	@ResponseBody
	public List<Map<Integer,Integer>> getMonthly(@PathVariable Integer year) {
		return borrowdao.getMonthly(year);
	}
	
	@RequestMapping(value= "/home/statistic/yearly")
	@ResponseBody
	public List<Map<Integer,Integer>> getYearly() {
		return borrowdao.getYearly();
	}
	
	@RequestMapping(value= "/home/statistic/week/{year}/{week}")
	@ResponseBody
	public List<Map<Integer,Integer>> getWeekly(@PathVariable Integer week, @PathVariable Integer year) {
		return borrowdao.getWeekly(week,year);
	}
	
	@RequestMapping(value= "/home/statistic/topbook/year/{year}")
	@ResponseBody
	public List<Map<Integer,String>> getTopBookOfDaYear(@PathVariable Integer year) {
		return borrowdao.getTopBookOfDaYear(year);
	}
	
	@RequestMapping(value= "/home/statistic/topbook/month/{year}/{month}")
	@ResponseBody
	public List<Map<Integer,String>> getTopBookOfDaYear(@PathVariable Integer year,@PathVariable Integer month) {
		return borrowdao.getTopBookOfDaMonth(year,month);
	}
	
	@RequestMapping(value= "/home/statistic/topbook/week/{year}/{week}")
	@ResponseBody
	public List<Map<Integer,Integer>> getTopBookOfDaWeek(@PathVariable Integer week,@PathVariable Integer year) {
		return borrowdao.getTopBookOfDaWeek(week,year);
	}
}
