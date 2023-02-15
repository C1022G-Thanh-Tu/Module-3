package repository;

import model.User;

import java.util.List;

public interface IUserRepository {
    void add (User user);
    User findById (int id);
    List<User> listAll (String countryName);
    void delete (User user);
    void update (User user);
    void addUserTransaction(User user, int[] permision);
}
