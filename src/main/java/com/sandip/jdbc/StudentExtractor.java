package com.sandip.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.dao.DataAccessException;

import com.sandip.model.Student;

public class StudentExtractor {
		public Student extractData(ResultSet resultSet) throws SQLException,DataAccessException{
			Student student=new Student();
			student.setId(resultSet.getInt(1));
			student.setName(resultSet.getString(2));
			student.setAddress(resultSet.getString(3));
			student.setRoll(resultSet.getInt(4));
			return student;
		}
}
