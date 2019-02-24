package com.sandip.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.sandip.model.Student;
import com.sandip.service.StudentService;

@Controller
public class StudentController {
	@Autowired
	private StudentService studentService;
	
	
	@RequestMapping("/home")
	public String getStudent(ModelMap map){
		map.put("student", new Student());
		return "home";
 }
	
	@RequestMapping("/listStudent")
	public String getStudentPage(ModelMap map){
		map.put("student", new Student());
		return "listStudent";
	}
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public @ResponseBody Student saveStudent(@RequestBody Student student) {
		return studentService.saveStudent(student);
		 
	}
	
	
	@RequestMapping(value="studentList", method=RequestMethod.GET)
	public  @ResponseBody List<Student> getAllStudent(){
		//map.put("studentList", studentService.studentList());
		return studentService.studentList();
	}
	
	@RequestMapping(value="studentList/{id}")
	public @ResponseBody Student studentListById(@PathVariable("id") int id){
		return studentService.getStudent(id);
	}
	
	@RequestMapping("delete/{id}")
	public @ResponseBody Student deleteStudent(@PathVariable ("id") int id){
		return studentService.deleteStudent(id);
	}

	@RequestMapping(value = "/edit")
	public ModelAndView editStudent(@ModelAttribute("student") Student student, BindingResult result) {
		Student student1 = studentService.getStudent(student.getId());
		ModelMap model= new ModelMap();
		model.put("student", student1);
		return new ModelAndView("listStudent", model);
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public @ResponseBody Student updateStudent(@RequestBody Student student) {
		return studentService.updateStudent(student);
		
	}
	
	
}
