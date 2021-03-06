// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.fundatiacomunitarabucuresti.volunteer.domain;

import java.util.List;
import org.springframework.transaction.annotation.Transactional;
import ro.fundatiacomunitarabucuresti.volunteer.domain.Volunteer;

privileged aspect Volunteer_Roo_Jpa_ActiveRecord {
    
    public static final List<String> Volunteer.fieldNames4OrderClauseFilter = java.util.Arrays.asList("skills", "expertSkills");
    
    public static long Volunteer.countVolunteers() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Volunteer o", Long.class).getSingleResult();
    }
    
    public static List<Volunteer> Volunteer.findAllVolunteers() {
        return entityManager().createQuery("SELECT o FROM Volunteer o", Volunteer.class).getResultList();
    }
    
    public static List<Volunteer> Volunteer.findAllVolunteers(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Volunteer o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Volunteer.class).getResultList();
    }
    
    public static Volunteer Volunteer.findVolunteer(Long id) {
        if (id == null) return null;
        return entityManager().find(Volunteer.class, id);
    }
    
    public static List<Volunteer> Volunteer.findVolunteerEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Volunteer o", Volunteer.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<Volunteer> Volunteer.findVolunteerEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Volunteer o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Volunteer.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public Volunteer Volunteer.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Volunteer merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
