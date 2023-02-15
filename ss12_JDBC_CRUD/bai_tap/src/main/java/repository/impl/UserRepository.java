package repository.impl;

import model.User;
import repository.IUserRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserRepository implements IUserRepository {

    @Override
    public void add(User user) {
//        PreparedStatement preparedStatement;
//        try {
//            preparedStatement = BaseRepository.getConnection().
//                    prepareStatement("insert into users (name, email, country) values (?,?,?)");
//            preparedStatement.setString(1, user.getName());
//            preparedStatement.setString(2, user.getEmail());
//            preparedStatement.setString(3, user.getCountry());
//            preparedStatement.executeUpdate();
//        } catch (SQLException throwables) {
//            throwables.printStackTrace();
//        }

        CallableStatement callableStatement;
        try {
            callableStatement = BaseRepository.getConnection().
                    prepareCall("call insert_user(?,?,?)");
            callableStatement.setString(1, user.getName());
            callableStatement.setString(2, user.getEmail());
            callableStatement.setString(3, user.getCountry());
            callableStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public User findById(int id) {
//        PreparedStatement preparedStatement = null;
//        try {
//            preparedStatement = BaseRepository.getConnection()
//                    .prepareStatement("select id, name, email, country from users where id =? order by name");
//            preparedStatement.setInt(1,id);
//            User user;
//            ResultSet resultSet = preparedStatement.executeQuery();
//            if (resultSet.next()) {
//                user = new User();
//                user.setId(resultSet.getInt("id"));
//                user.setName(resultSet.getString("name"));
//                user.setEmail(resultSet.getString("email"));
//                user.setCountry(resultSet.getString("country"));
//                return user;
//            }
//        } catch (SQLException throwables) {
//            throwables.printStackTrace();
//        }
//
//        return null;
        CallableStatement callableStatement = null;
        try {
            callableStatement = BaseRepository.getConnection()
                    .prepareCall("call find_user_by_id (?)");
            callableStatement.setInt(1,id);
            User user;
            ResultSet resultSet = callableStatement.executeQuery();
            if (resultSet.next()) {
                user = new User();
                user.setId(resultSet.getInt("id"));
                user.setName(resultSet.getString("name"));
                user.setEmail(resultSet.getString("email"));
                user.setCountry(resultSet.getString("country"));
                return user;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return null;
    }

    @Override
    public List<User> listAll(String countryName) {
//        List<User> userList = new ArrayList<>();
//        try {
//            PreparedStatement preparedStatement = BaseRepository.getConnection()
//                    .prepareStatement("select id, name, email, country from users where country like concat('%' , ? ,'%') order by name");
//            preparedStatement.setString(1, countryName);
//            ResultSet resultSet = preparedStatement.executeQuery();
//            User user;
//            while (resultSet.next()) {
//                user = new User();
//                user.setId(resultSet.getInt("id"));
//                user.setName(resultSet.getString("name"));
//                user.setEmail(resultSet.getString("email"));
//                user.setCountry(resultSet.getString("country"));
//                userList.add(user);
//            }
//        } catch (SQLException throwables) {
//            throwables.printStackTrace();
//        }
//        return userList;

        List<User> userList = new ArrayList<>();
        try {
            CallableStatement callableStatement = BaseRepository.getConnection()
                    .prepareCall("call list_user (?)");
            callableStatement.setString(1, countryName);
            ResultSet resultSet = callableStatement.executeQuery();
            User user;
            while (resultSet.next()) {
                user = new User();
                user.setId(resultSet.getInt("id"));
                user.setName(resultSet.getString("name"));
                user.setEmail(resultSet.getString("email"));
                user.setCountry(resultSet.getString("country"));
                userList.add(user);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return userList;
    }

    @Override
    public void delete(User user) {
//        try {
//            PreparedStatement preparedStatement = BaseRepository.getConnection()
//                    .prepareStatement("delete from users where id = ?");
//            preparedStatement.setInt(1, user.getId());
//            preparedStatement.executeUpdate();
//        } catch (SQLException throwables) {
//            throwables.printStackTrace();
//        }

        try {
            CallableStatement callableStatement = BaseRepository.getConnection()
                    .prepareCall("call delete_user (?)");
            callableStatement.setInt(1, user.getId());
            callableStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public void update(User user) {
//        PreparedStatement preparedStatement = null;
//        try {
//            preparedStatement = BaseRepository.getConnection()
//                    .prepareStatement("update users\n" +
//                    "set name = ?, email = ?, country = ? \n" +
//                    "where id = ?");
//            preparedStatement.setString(1, user.getName());
//            preparedStatement.setString(2, user.getEmail());
//            preparedStatement.setString(3, user.getCountry());
//            preparedStatement.setInt(4, user.getId());
//            preparedStatement.executeUpdate();
//        } catch (SQLException throwables) {
//            throwables.printStackTrace();
//        }

        try {
            CallableStatement callableStatement = BaseRepository.getConnection()
                    .prepareCall("call update_user(?, ?, ?, ?)");
            callableStatement.setString(1, user.getName());
            callableStatement.setString(2, user.getEmail());
            callableStatement.setString(3, user.getCountry());
            callableStatement.setInt(4, user.getId());
            callableStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public void addUserTransaction(User user, int[] permisions) {

//        Connection conn = null;
//
//        // for insert a new user
//
//        PreparedStatement pstmt = null;
//
//        // for assign permision to user
//
//        PreparedStatement pstmtAssignment = null;
//
//        // for getting user id
//
//        ResultSet rs = null;
//
//        try {
//
//            conn = BaseRepository.getConnection();
//
//            // set auto commit to false
//
//            conn.setAutoCommit(false);
//
//            //
//
//            // Insert user
//
//            //
//
//            pstmt = conn.prepareStatement(INSERT_USERS_SQL, Statement.RETURN_GENERATED_KEYS);
//
//            pstmt.setString(1, user.getName());
//
//            pstmt.setString(2, user.getEmail());
//
//            pstmt.setString(3, user.getCountry());
//
//            int rowAffected = pstmt.executeUpdate();
//
//            // get user id
//
//            rs = pstmt.getGeneratedKeys();
//
//            int userId = 0;
//
//            if (rs.next())
//
//                userId = rs.getInt(1);
//
//            //
//
//            // in case the insert operation successes, assign permision to user
//
//            //
//
//            if (rowAffected == 1) {
//
//                // assign permision to user
//
//                String sqlPivot = "INSERT INTO user_permision(user_id,permision_id) "
//
//                        + "VALUES(?,?)";
//
//                pstmtAssignment = conn.prepareStatement(sqlPivot);
//
//                for (int permisionId : permisions) {
//
//                    pstmtAssignment.setInt(1, userId);
//
//                    pstmtAssignment.setInt(2, permisionId);
//
//                    pstmtAssignment.executeUpdate();
//
//                }
//
//                conn.commit();
//
//            } else {
//
//                conn.rollback();
//
//            }
//
//        } catch (SQLException ex) {
//
//            // roll back the transaction
//
//            try {
//
//                if (conn != null)
//
//                    conn.rollback();
//
//            } catch (SQLException e) {
//
//                System.out.println(e.getMessage());
//
//            }
//
//            System.out.println(ex.getMessage());
//
//        } finally {
//
//            try {
//
//                if (rs != null) rs.close();
//
//                if (pstmt != null) pstmt.close();
//
//                if (pstmtAssignment != null) pstmtAssignment.close();
//
//                if (conn != null) conn.close();
//
//            } catch (SQLException e) {
//
//                System.out.println(e.getMessage());
//
//            }
//
//        }

    }
}
