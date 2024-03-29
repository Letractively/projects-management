package by.vsu.mf.ammc.pm.dao.mysql.user;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import by.vsu.mf.ammc.pm.dao.abstraction.user.ContactsTypeDao;
import by.vsu.mf.ammc.pm.dao.mysql.BaseDaoImpl;
import by.vsu.mf.ammc.pm.dao.mysql.project.specification.RequirementDaoImpl;
import by.vsu.mf.ammc.pm.domain.user.ContactsType;
import by.vsu.mf.ammc.pm.exception.PersistentException;

public class ContactsTypeDaoImpl extends BaseDaoImpl implements ContactsTypeDao {
	private static Logger logger = Logger.getLogger( RequirementDaoImpl.class);
	private Map< Integer, ContactsType > cacheMap = new HashMap<>( );
	@Override
	public Integer create(ContactsType entity) throws PersistentException {
		String sql = "INSERT INTO `contacts_type` (`name`, `regexp`) VALUES (?, ?)";
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			preparedStatement = getConnection().prepareStatement(sql,
					PreparedStatement.RETURN_GENERATED_KEYS);
			preparedStatement.setString(1, entity.getName());
			preparedStatement.setString(2, entity.getRegexp());
			
			preparedStatement.executeUpdate();
			resultSet = preparedStatement.getGeneratedKeys();
			if (resultSet.next()) {
				return resultSet.getInt(1);
			} else {
				logger.error("There is problem with index after trying to add record into table 'contacts_type'");
				throw new PersistentException();
			}
		} catch (SQLException e) {
			logger.error("Creation of record was failed. Table 'contacts_type'",
					e);
			throw new PersistentException(e);
		} finally {
			try {
				resultSet.close();
			} catch (SQLException | NullPointerException e) {
			}
			try {
				preparedStatement.close();
			} catch (SQLException | NullPointerException e) {
			}
		}
	}

	@Override
	public ContactsType read(Integer id) throws PersistentException {
		if ( cacheMap.containsKey( id ) ) {
            return cacheMap.get( id );
        }
        String sql = "SELECT `name`, `regexp` FROM `contacts_type` WHERE id = ?";
		PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        
        try {
        	
            preparedStatement = getConnection().prepareStatement( sql, PreparedStatement.RETURN_GENERATED_KEYS);
            preparedStatement.setInt( 1 , id );
            resultSet = preparedStatement.executeQuery();
            ContactsType contacts = getEntityFactory().create(ContactsType.class);
            if( resultSet.next() ) {
            	contacts.setId( id );
            	contacts.setName( resultSet.getString("name") );
            	contacts.setRegexp(resultSet.getString("regexp") );
            	
            }
            cacheMap.put( id, contacts );
            return contacts;
        } catch( SQLException e) {
            logger.error( "Reading of record was failed. Table 'contacts_type'", e);
            throw new PersistentException(e);
        } finally {
            try {
                resultSet.close();
            } catch ( SQLException | NullPointerException e) {}
            try {
                preparedStatement.close();
            } catch ( SQLException | NullPointerException e) {}
        }
	}

	@Override
	public void update(ContactsType entity) throws PersistentException {
		String sql = "UPDATE `contacts_type` SET `name` = ?, `regexp` = ? WHERE `id` = ?";
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = getConnection().prepareStatement( sql );

            preparedStatement.setString(1, entity.getName());
            preparedStatement.setString(2, entity.getRegexp());
            preparedStatement.setInt( 3, entity.getId() );
            preparedStatement.executeUpdate();
            cacheMap.clear();
        } catch( SQLException e) {
            logger.error( "Updating of record was failed. Table 'contacts_type'", e);
            throw new PersistentException(e);
        } finally {
            try {
                preparedStatement.close();
            } catch ( SQLException | NullPointerException e) {}
        }
	}

	@Override
	public void delete(Integer id) throws PersistentException {
		String sql = "DELETE FROM `contacts_type` WHERE `id` = ?";
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = getConnection().prepareStatement( sql );
            preparedStatement.setInt( 1, id );
            preparedStatement.executeUpdate();
            cacheMap.clear();
        }catch ( SQLException e) {
            logger.error( "Deleting of record was failed. Table 'contacts_type' ", e);
            throw new PersistentException(e);
        } finally {
            try {
                preparedStatement.close();
            } catch ( SQLException  | NullPointerException e) {}
        }
	}

	@Override
	public List<ContactsType> readAll() throws PersistentException {
		String sql = "SELECT * FROM `contacts_type`";
		PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            preparedStatement = getConnection().prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            resultSet = preparedStatement.executeQuery();
            List<ContactsType> result = new ArrayList<ContactsType>();
            while (resultSet.next()) {
            	ContactsType ct = getEntityFactory().create(ContactsType.class);
            	ct.setId(resultSet.getInt("id"));
            	ct.setName(resultSet.getString("name"));
            	ct.setRegexp(resultSet.getString("regexp"));
            	result.add(ct);
            }
            return result;
        } catch( SQLException e) {
            logger.error( "Reading of record was failed. Table 'contacts_type'", e);
            throw new PersistentException(e);
        } finally {
            try {
                resultSet.close();
            } catch ( SQLException | NullPointerException e) {}
            try {
                preparedStatement.close();
            } catch ( SQLException | NullPointerException e) {}
        }
	}

}
