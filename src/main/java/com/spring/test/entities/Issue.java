package com.spring.test.entities;

import java.io.Serializable;
import java.sql.Date;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

/**
 *
 * @author linus
 */
@Entity
@Table(name = "issue")
public class Issue implements Serializable{
    private static final long serialVersionUID = -5527566243545296042L;

    @Id
    @Column(name = "ID")
    @GeneratedValue
    private Integer Id;

    @Column(name = "summary")
    private String summary;

    @Column(name = "fullDetails")
    private String fullDetails;

    @OneToOne(cascade = CascadeType.DETACH)
    private User assignedTo;

    @Column(name = "status")
    private Boolean status;

    @OneToOne(cascade = CascadeType.PERSIST)
    private User identifiedBy;

    @Column(name = "dateIdentified")
    private Date dateIdentified;

    @Column(name = "resolutionDate")
    private Date resolutionDate;
    
    @Column(name="closingComment")
    private String closingComments;
    
    
    public String getClosingComments(){
        return closingComments;
    }
    
    public void setClosingComments(String comment){
        closingComments = comment;
    }
    
    public Date getResolutionDate(){
        return resolutionDate;
    }
    
    public void setResolutionDate(Date date){
        resolutionDate = date;
    }
    
    public void setDateIdentified(Date date){
        dateIdentified = date;
    }
    
    public Date getDateIdentified(){
        return dateIdentified;
    }
    
    public User getAssignedTo(){
        return assignedTo;
    }
    
    public void setAssignedTo(User assTo){
        assignedTo = assTo;
    }
    
    public void setFullDetails(String details){
        fullDetails = details;
    }
    
    public String getFullDetails(){
        return fullDetails;
    }
    
    public String getSummary(){
        return summary;
    }
    
    public boolean getStatus(){
        return status;
    }
    
    public void setStatus(boolean stat){
        status = stat;
    }

    public Integer getId() {
        return Id;
    }

    public void setId(int id) {
        Id = id;
    }

    public void setSummary(String sum) {
        summary = sum;
    }
    
    public User getIdentifiedBy(){
        return identifiedBy;
    }
    
    public void setIdentifiedBy(User iden){
        identifiedBy = iden;
    }
}
