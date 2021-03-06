package project.persistence.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import project.persistence.entities.Entry;

public interface EntryRepository  extends JpaRepository<Entry, Long>{
	
	@SuppressWarnings("unchecked")
	Entry save(Entry entry);

    void delete(Entry entry);
    
    Entry findOne(Long id);
    
    List<Entry> findAll();

    List<Entry> findByEmployeeIdAndOutTimeIsNull(Long employeeId);
    
    List<Entry> findByEmployeeId(Long employeeId);
    
    List<Entry> findByIsVerified(boolean isVerified);
    
    List<Entry> findByIsVerifiedAndDepartment(boolean isVerified, String department);
        
    List<Entry> findById(Long id);
    
    

}
