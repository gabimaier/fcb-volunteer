// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.fundatiacomunitarabucuresti.volunteer.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.Table;
import javax.persistence.Version;
import ro.fundatiacomunitarabucuresti.volunteer.domain.UserAccount;

privileged aspect UserAccount_Roo_Jpa_Entity {
    
    declare @type: UserAccount: @Entity;
    
    declare @type: UserAccount: @Table(name = "user_accounts");
    
    declare @type: UserAccount: @Inheritance(strategy = InheritanceType.JOINED);
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long UserAccount.id;
    
    @Version
    @Column(name = "version")
    private Integer UserAccount.version;
    
    public Long UserAccount.getId() {
        return this.id;
    }
    
    public void UserAccount.setId(Long id) {
        this.id = id;
    }
    
    public Integer UserAccount.getVersion() {
        return this.version;
    }
    
    public void UserAccount.setVersion(Integer version) {
        this.version = version;
    }
    
}
