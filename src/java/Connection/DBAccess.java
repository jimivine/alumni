/**
 * @author jimivine
 *
 */
package Connection;

import static Connection.DBAccess.getConnection;
import Objects.Student;
import Objects.Friend;
import Objects.University;
import Objects.UserInfo;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

//****************************************************************************
@WebServlet(name = "DBAccess", urlPatterns = {"/DBAccess"})
public class DBAccess extends HttpServlet {

    public static Connection getConnection()
            throws ClassNotFoundException, SQLException {

        Class.forName("org.postgresql.Driver");
        String jdbcUrl = "jdbc:postgresql://localhost/test";
        String username = "postgres";
        String password = "dbpassword";

        return (DriverManager.getConnection(jdbcUrl, username, password));
    }

//****************************************************************************
    public static boolean getLoginDetails(String username, String password) {

        /*
         Connect to database
         Run query - find student
         If not found
         return false
         else
         check passwords match
         if passwords match
         return true
         else
         return false        
         */
        try {

            ResultSet rs; // Holds the result from the SQL query
            String passwordRecorded = null; // Holds the password on the database

            try (Connection connection = getConnection()) //Opens database
            {
                String query = "SELECT * FROM Student WHERE student_name = '" + username + "'";

                PreparedStatement statement = connection.prepareStatement(query);

                rs = statement.executeQuery(); //Creates a resultset of all students
            }

            while (rs.next()) {
                passwordRecorded = rs.getString("password");
            }
            if (passwordRecorded.equals(password)) {
                return true;
            } else {
                return false;
            }
        } catch (Exception ex) {
            System.err.println(ex);
            return false;
        }
    }

//****************************************************************************    
    public static Student getUserInfo(String username) {

        try {

            String fullNameRec = "";
            String uniRec = "";
            String yearsRec = "";
            String courseRec = "";
            String statusRec = "";

            ResultSet rs; // Holds the result from the SQL query
            Connection connection = getConnection();//Creates connection

            String query = "SELECT * FROM student WHERE student_name = '" + username + "'";
            PreparedStatement statement = connection.prepareStatement(query, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            rs = statement.executeQuery();

            while (rs.next()) {
                fullNameRec = rs.getString("full_name");
                uniRec = rs.getString("uni_name");
                yearsRec = rs.getString("years");
                courseRec = rs.getString("course");
                statusRec = rs.getString("status");
            }

            Student userOutput = new Student(fullNameRec, uniRec, yearsRec, courseRec, statusRec);

            rs.last();
            int numRows = rs.getRow();

            connection.close();

            if (numRows < 1) {
                userOutput = null;
            }
            return userOutput;

        } catch (Exception e) {
            System.err.println(e);
            return null;
        }
    }

//****************************************************************************
    public static boolean addStudent(String studentname, String password, String email, String fullname) {

        /*
         Connect to db
         Check if student exists
         If exists
         return false
         else
         create student
         */
        Connection connection;
        ResultSet rs; // Holds the result from the SQL query
        String query;
        String studentnameRecorded = null;

        try {
            connection = getConnection(); //Connect to db

            query = "SELECT * FROM student WHERE student_name = '" + studentname + "'";
            PreparedStatement statement = connection.prepareStatement(query, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            rs = statement.executeQuery();

            rs.last();
            int numRows = rs.getRow();
            if (numRows > 0) {
                return false;
            }
        } catch (Exception e) {
            System.err.println(e);
            return false;
        }

        try {
            query = "INSERT INTO Student (student_name, password, email, full_name) VALUES (?,?,?,?)";
            PreparedStatement registerStatement = connection.prepareStatement(query);
            registerStatement.setString(1, studentname);
            registerStatement.setString(2, password);
            registerStatement.setString(3, email);
            registerStatement.setString(4, fullname);
            registerStatement.executeUpdate();      //Inserts into Student database
            return true;
        } catch (Exception e) {
            System.err.println(e);
            return false;
        }
    }

//****************************************************************************
    public static ArrayList<University> getAllUnis() {

        ResultSet rs; // Holds the result from the SQL query

        ArrayList<University> unis = new ArrayList<University>();

        try {

            Connection connection = getConnection();//Opens database

            String query = "SELECT * FROM University";
            PreparedStatement statement = connection.prepareStatement(query);
            rs = statement.executeQuery(); //Creates a resultset of all universities

            while (rs.next()) {
                /*
                 uniId = rs.getInt("uni_id");
                 uniName = rs.getString("uni_name");
                 uniAdd1 = rs.getString("uni_addr1");
                 uniAdd2 = rs.getString("uni_addr2");
                 uniAdd3 = rs.getString("uni_addr3");
                 uniAdd4 = rs.getString("uni_addr4");
                 uniPostcode = rs.getString("uni_postcode");
                 uniEmail = rs.getString("uni_email");
                 uniDesc = rs.getString("uni_description");*/

                unis.add(new University(
                        rs.getString("uni_name")
                ));
            }

            return unis;

        } catch (Exception e) {
            System.err.println(e);
            return null;
        }
    }

//****************************************************************************
    public static boolean updStudent(String studentname, String fullname, String uni, String years, String course, String status) {

        /*
         Connect to db
         Check if student exists
         If exists
         return false
         else
         update student
         */
        Connection connection;
        ResultSet rs; // Holds the result from the SQL query
        String query;
        String uniRecorded = null;

        try {
            connection = getConnection(); //Connect to db

            query = "SELECT * FROM student WHERE student_name = '" + studentname + "'";
            PreparedStatement statement = connection.prepareStatement(query, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            rs = statement.executeQuery();

            rs.last();
            int numRows = rs.getRow();
            if (numRows < 1) {
                return false;
            }
        } catch (Exception e) {
            System.err.println(e);
            return false;
        }

        try {
            query = "UPDATE Student SET full_name=?, uni_name=?, years=?, course=?, status=? WHERE student_name=?";
            PreparedStatement registerStatement = connection.prepareStatement(query);
            registerStatement.setString(1, fullname);
            registerStatement.setString(2, uni);
            registerStatement.setString(3, years);
            registerStatement.setString(4, course);
            registerStatement.setString(5, status);
            registerStatement.setString(6, studentname);
            registerStatement.executeUpdate();      //Inserts into Student database
            return true;
        } catch (Exception e) {
            System.err.println(e);
            return false;
        }
    }

//****************************************************************************    
    public static boolean checkUniExists(String uni) {

        /*
         Connect to database
         Run query to find uni
         If not found
         return false
         else
         return true     
         */
        try {

            ResultSet rs; // Holds the result from the SQL query

            Connection connection = getConnection(); //Opens database

            String query = "SELECT * FROM University WHERE uni_name = '" + uni + "'";
            PreparedStatement statement = connection.prepareStatement(query, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            rs = statement.executeQuery();

            rs.last();
            int numRows = rs.getRow();
            if (numRows < 1) {
                return false;
            } else {
                return true;
            }

        } catch (Exception ex) {
            System.err.println(ex);
            return false;
        }
    }
    
//****************************************************************************
    public static ArrayList<Friend> getAllFriends(String username) {

        ResultSet rs; // Holds the result from the SQL query

        ArrayList<Friend> friends = new ArrayList<Friend>();

        try {

            Connection connection = getConnection();//Opens database

            String query = "SELECT * FROM Friends WHERE student_name ='" + username + "'";
            PreparedStatement statement = connection.prepareStatement(query);
            rs = statement.executeQuery(); //Creates a resultset of all universities

            while (rs.next()) {
                /*
                 uniId = rs.getInt("uni_id");
                 uniName = rs.getString("uni_name");
                 uniAdd1 = rs.getString("uni_addr1");
                 uniAdd2 = rs.getString("uni_addr2");
                 uniAdd3 = rs.getString("uni_addr3");
                 uniAdd4 = rs.getString("uni_addr4");
                 uniPostcode = rs.getString("uni_postcode");
                 uniEmail = rs.getString("uni_email");
                 uniDesc = rs.getString("uni_description");*/

                friends.add(new Friend(
                        rs.getString("friends_name")
                ));
            }

            return friends;

        } catch (Exception e) {
            System.err.println(e);
            return null;
        }
    }
//****************************************************************************
    public static boolean addFriend(String studentname, String friendsname) {


        Connection connection;

        String query;


        try {
            connection = getConnection(); //Connect to db

            query = "INSERT INTO friends (student_name, friends_name) VALUES (?,?)";
            PreparedStatement registerStatement = connection.prepareStatement(query);
            registerStatement.setString(1, studentname);
            registerStatement.setString(2, friendsname);
            registerStatement.executeUpdate();      //Inserts into Student database
            return true;
        } catch (Exception e) {
            System.err.println(e);
            return false;
        }
    }
}
