package org.obliquid.crm.runner;

import org.obliquid.crm.domain.Customer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallback;
import org.springframework.transaction.support.TransactionTemplate;

/**
 * Simple application to load and display a customer.
 * 
 * @author stivlo
 * 
 */
@Service
public class ReadCustomer {

        @Autowired
        private TransactionTemplate transactionTemplate;

        private void run() {
                transactionTemplate.execute(new TransactionCallback<Boolean>() {
                        @Override
                        public Boolean doInTransaction(TransactionStatus status) {
                                //find a customer by id, it returns null when not found
                                Customer aCustomer = Customer.findCustomer(3L);
                                System.out.println(aCustomer);
                                return true;
                        }
                });
        }

        public static void main(final String[] args) {
                String path = "classpath*:META-INF/spring/applicationContext*.xml";
                final ClassPathXmlApplicationContext factory = new ClassPathXmlApplicationContext(path);
                factory.getBean(ReadCustomer.class).run();
        }

}
