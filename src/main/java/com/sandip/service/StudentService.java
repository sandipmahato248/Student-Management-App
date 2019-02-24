package com.sandip.service;

import java.util.List;

import com.sandip.model.Student;
// Defining interface for service layer
public interface StudentService {

	public Student saveStudent(Student student);
	public List<Student> studentList();
	public Student deleteStudent(int id);
	public Student getStudent(int id);
	public Student updateStudent(Student student);

}
