package service;

import model.User;

import java.util.List;

public interface IUserService {
    void add (User user);
    User findById (int id);
    List<User> listAll (String countryName);
    void delete (User user);
    void update (User user);
}
