package project.demo.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import project.demo.entities.Course;

public class RowMapperImpl implements RowMapper<Course> {

	public Course mapRow(ResultSet rs, int rowNum) throws SQLException {
		Course course = new Course();
		course.setCourseId(rs.getInt("courseId"));
		course.setCourseName(rs.getString("courseName"));
		course.setDescription(rs.getString("description"));
		course.setCategory(rs.getString("category"));
		course.setIntendedAudience(rs.getString("intendedAudience"));
		course.setBenefits(rs.getString("benefits"));

		return course;
	}

}
