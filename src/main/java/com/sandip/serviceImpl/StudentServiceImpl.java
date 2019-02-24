package com.sandip.serviceImpl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.sandip.dao.StudentDao;
import com.sandip.model.Student;
import com.sandip.service.StudentService;

//This class is used for service implementation
@Service
public class StudentServiceImpl implements StudentService {

	@Autowired
	private StudentDao studentDao;

	public Student saveStudent(Student student) {
		return studentDao.saveStudent(student);
	}

	public List<Student> studentList() {
		return studentDao.studentList();
	}

	public Student deleteStudent(int id) {
		return studentDao.deleteStudent(id);
	}

	public Student updateStudent(Student student) {
		return studentDao.updateStudent(student);
	}

	public Student getStudent(int id) {
		return studentDao.getStudent(id);
	}

}
