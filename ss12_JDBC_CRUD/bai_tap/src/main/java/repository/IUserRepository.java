package repository;

import model.User;

import java.util.List;

public interface IUserRepository {
    void add (User user);
    User findById (int id);
    List<User> listAll ();
    void delete (int id);
    void update (User user);
}
