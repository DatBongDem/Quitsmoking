/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import static Utils.DBUtils.getConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import DTO.Coach;

/**
 *
 * @author Nghia
 */
public class CoachDao {

    public Coach checkLogin(String username, String pass) throws ClassNotFoundException {
        String sql = "SELECT * FROM Coach WHERE IDCoach = ? AND password = ?";
        Connection con = null;
        Coach coach = null;

        try {

            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, pass);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {

               coach = new Coach();
                coach.setIDCoach(rs.getString(1));             // IDCoach
                coach.setPassword(rs.getString(2));            // password
                coach.setCoachName(rs.getString(3));           // coachName
                coach.setPhone(rs.getString(4));                // phone
                coach.setEmail(rs.getString(5));                // email
                coach.setAddress(rs.getString(6));              // address
                coach.setDateOfBirth(rs.getDate(7).toLocalDate());  // dateOfBirth (java.sql.Date -> LocalDate)
                coach.setSpecialization(rs.getString(8));       // specialization
                coach.setExperienceYears(rs.getInt(9));          // experienceYears

               
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return coach;
    }
   
   
}
