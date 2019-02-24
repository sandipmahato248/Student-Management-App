package com.sandip.dao;

import java.util.List;

import com.sandip.model.Student;
// Defining interface for Dao Layer
public interface StudentDao {
	public Student saveStudent(Student student);
	public List<Student> studentList();
	public Student deleteStudent(int id);
	public Student getStudent(int id);
	public Student updateStudent(Student student);
	
		
	
}
