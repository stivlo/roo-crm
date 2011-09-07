package org.obliquid.crm.runner;

import java.util.List;

import javax.persistence.TypedQuery;

import org.obliquid.crm.domain.Customer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallback;
import org.springframework.transaction.support.TransactionTemplate;

/**
 * Simple application to find a customer by first name.
 * 
 * @author stivlo
 * 
 */
@Service
public class FindCustomerByName {

        @Autowired
        private TransactionTemplate transactionTemplate;

        private void run() {
                transactionTemplate.execute(new TransactionCallback<Boolean>() {
                        @Override
                        public Boolean doInTransaction(TransactionStatus status) {
                                //find customers by first name like, * and % can be used as wildcards
                                //if no customers couldn't be found 
                                TypedQuery<Customer> query = Customer.findCustomersByFirstNameLike("Ste*");
                                List<Customer> customers = query.getResultList();
                                System.out.println("Customers: " + customers);
                                return true;
                        }
                });
        }

        public static void main(final String[] args) {
                String path = "classpath*:META-INF/spring/applicationContext*.xml";
                final ClassPathXmlApplicationContext factory = new ClassPathXmlApplicationContext(path);
                factory.getBean(FindCustomerByName.class).run();
        }

}
