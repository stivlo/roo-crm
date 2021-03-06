// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.obliquid.crm.domain;

import java.lang.Long;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PersistenceContext;
import javax.persistence.Table;
import org.obliquid.crm.domain.Company;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Company_Roo_Entity {
    
    declare @type: Company: @Entity;
    
    declare @type: Company: @Table(name = "COMPANY", schema = "roo_crm");
    
    @PersistenceContext
    transient EntityManager Company.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "COMPANY_ID")
    private Long Company.companyId;
    
    public Long Company.getCompanyId() {
        return this.companyId;
    }
    
    public void Company.setCompanyId(Long id) {
        this.companyId = id;
    }
    
    @Transactional
    public void Company.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Company.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Company attached = Company.findCompany(this.companyId);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Company.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Company.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Company Company.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Company merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager Company.entityManager() {
        EntityManager em = new Company().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Company.countCompanys() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Company o", Long.class).getSingleResult();
    }
    
    public static List<Company> Company.findAllCompanys() {
        return entityManager().createQuery("SELECT o FROM Company o", Company.class).getResultList();
    }
    
    public static Company Company.findCompany(Long companyId) {
        if (companyId == null) return null;
        return entityManager().find(Company.class, companyId);
    }
    
    public static List<Company> Company.findCompanyEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Company o", Company.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
