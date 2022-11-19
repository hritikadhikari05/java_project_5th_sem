/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import Signup.User;

//import net.javaguides.login.bean.LoginBean;
public class LoginDao {

    public boolean validate(User loginBean) throws ClassNotFoundException {
        boolean status = false;

        Class.forName("com.mysql.jdbc.Driver");

        try ( Connection connection = DriverManager
                .getConnection("jdbc:mysql://localhost:3306/student", "root", ""); // Step 2:Create a statement using connection object
                  PreparedStatement preparedStatement = connection
                        .prepareStatement("select * from user where email = ? and password = ? ")) {
            preparedStatement.setString(1, loginBean.getEmail());
            preparedStatement.setString(2, loginBean.getPassword());

            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
//                        System.out.println(rs.first());

            while (rs.next()) {

                String role = rs.getString("role");
                String id = rs.getString("id");
                
                                status = true;
                                
                loginBean.setId(id);

                loginBean.setRole(role);
//                System.out.println(id);

            }

            System.out.println(status);
        } catch (SQLException e) {
            // process sql exception
            printSQLException(e);
        }
        return status;

    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
