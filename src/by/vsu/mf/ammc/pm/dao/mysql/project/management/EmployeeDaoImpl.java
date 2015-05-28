package by.vsu.mf.ammc.pm.dao.mysql.project.management;

import by.vsu.mf.ammc.pm.dao.abstraction.project.management.EmployeeDao;
import by.vsu.mf.ammc.pm.dao.mysql.BaseDaoImpl;
import by.vsu.mf.ammc.pm.domain.project.management.Employee;
import by.vsu.mf.ammc.pm.domain.project.management.EmployeesRole;
import by.vsu.mf.ammc.pm.domain.project.management.Team;
import by.vsu.mf.ammc.pm.domain.user.User;
import by.vsu.mf.ammc.pm.exception.PersistentException;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

public class EmployeeDaoImpl extends BaseDaoImpl implements EmployeeDao {
    private Map< Integer, Employee > cacheMap = new HashMap<>( );
	@Override
	public Integer create(Employee employee) throws PersistentException {
		String sql = "INSERT INTO `employee` (`user_id`, `team_id`, `role`) VALUES (?, ?, ?)";
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		try {
			statement = getConnection().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			statement.setInt(1, employee.getUser().getId());
			statement.setInt(2, employee.getTeam().getId());
			statement.setByte(3, (byte)employee.getRole().ordinal());
			statement.executeUpdate();
			resultSet = statement.getGeneratedKeys();
			if(resultSet.next()) {
                int id = resultSet.getInt(1);
                cacheMap.put(id, employee);
                return id;
			} else {
				throw new PersistentException();
			}
		} catch(SQLException e) {
			throw new PersistentException(e);
		} finally {
			try {
				resultSet.close();
			} catch(SQLException | NullPointerException e) {}
			try {
				statement.close();
			} catch(SQLException | NullPointerException e) {}
		}
	}

	@Override
	public Employee read(Integer id) throws PersistentException {
        if (cacheMap.containsKey(id)) return cacheMap.get(id);
		String sql = "SELECT `user_id`, `team_id`, `role` FROM `employee` WHERE `id` = ?";
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		try {
			statement = getConnection().prepareStatement(sql);
			statement.setInt(1, id);
			resultSet = statement.executeQuery();
			Employee employee = null;
			if(resultSet.next()) {
				employee = new Employee();
				employee.setId(id);
				User user = new User();
				user.setId(resultSet.getInt("user_id"));
				employee.setUser(user);
				Team team = new Team();
				team.setId(resultSet.getInt("team_id"));
				employee.setTeam(team);
				employee.setRole(EmployeesRole.values()[resultSet.getByte("role")]);
			}
			return employee;
		} catch(SQLException e) {
			throw new PersistentException(e);
		} finally {
			try {
				resultSet.close();
			} catch(SQLException | NullPointerException e) {}
			try {
				statement.close();
			} catch(SQLException | NullPointerException e) {}
		}
	}

	@Override
	public void update(Employee employee) throws PersistentException {
		String sql = "UPDATE `employee` SET `user_id` = ?, `team_id` = ?, `role` = ? WHERE `id` = ?";
		PreparedStatement statement = null;
		try {
			statement = getConnection().prepareStatement(sql);
			statement.setInt(1, employee.getUser().getId());
			statement.setInt(2, employee.getTeam().getId());
			statement.setByte(3, (byte)employee.getRole().ordinal());
			statement.setInt(4, employee.getId());
			statement.executeUpdate();
			cacheMap.put(employee.getId(), employee);
		} catch(SQLException e) {
			throw new PersistentException(e);
		} finally {
			try {
				statement.close();
			} catch(SQLException | NullPointerException e) {}
		}
	}

	@Override
	public void delete(Integer id) throws PersistentException {
		String sql = "DELETE FROM `employee` WHERE `id` = ?";
		PreparedStatement statement = null;
		try {
			statement = getConnection().prepareStatement(sql);
			statement.setInt(1, id);
			statement.executeUpdate();
			cacheMap.remove(id);
		} catch(SQLException e) {
			throw new PersistentException(e);
		} finally {
			try {
				statement.close();
			} catch(SQLException | NullPointerException e) {}
		}
	}
}