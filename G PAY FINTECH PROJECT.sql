SELECT * FROM users_s;
SELECT * FROM transactions_s;
SELECT * FROM fraud_flags;



       SELECT 
         count(user_id) as total_user_in_lagos 
            from users_s
            where city = 'lagos';
            
            
            
            select 
                distinct transaction_id
                from transactions_s
                where transaction_amount > 100000;
                 
                 
                 
                 select 
                    user_id,
                    device_type
                       from users_s
                       where device_type = 'ussd';
                       
                       
                       
                     select 
                        transaction_type 
                            from transactions_s
                            group by transaction_type;
                            
                            
                            
                            select 
                                city,
                               round(sum(transaction_amount),2) as total_revenue
                                from users_s
                                join transactions_s
                                 on users_s.user_id = transactions_s.user_id
                                 group by city
                                 order by total_revenue desc;
                            
                       
                 
                 select 
                   merchant_category,
                       count(transactions_s.transaction_id) as total_transactions
                       from transactions_s
                       group by merchant_category
                       order by total_transactions desc;
                 
                 
                 
            
                     select 
                        transaction_type,
                        round(avg(transaction_amount),2) as avg_transaction_amount
                        from transactions_s
                        group by transaction_type
                        order by avg_transaction_amount desc;
                        
                        
                        
                        select 
                          users_s.user_id,
                             count(transaction_id) as transactions_
                             from users_s
                             join transactions_s
                             on users_s.user_id = transactions_s.user_id
                             group by user_id 
                             having count(transaction_id) > 10
                             order by transactions_ desc; 
                             
                             
                             select 
                              city, 
                              fraud_status,
                               count(transactions_s.transaction_id) as transaction_
                               from users_s
                               join transactions_s
                               on users_s.user_id = transactions_s.user_id
                               join fraud_flags
                               on transactions_s.transaction_id = fraud_flags.transaction_id
                               where fraud_status = 'fraud'
                               group by city 
                               order by transaction_ desc;
                               
                            
                            
                            with pct as(
                            select 
                              t.merchant_category,
                                 count( t.transaction_id) as transaction_count,
                                    sum(case when fraud_status = 'fraud' then 1 else 0
                                      end )as fraud_count 
                                      from transactions_s as t
                                      join fraud_flags as f
                                         on t.transaction_id = f.transaction_id
                                         group by  merchant_category
                                         ) 
                                         select  
                                           merchant_category,
                                           transaction_count,
                                           fraud_count,
                                           (fraud_count * 100.0 / transaction_count) as fraud_pct
                                           from pct
                                           order by fraud_pct desc;
                                           
                                           
                                           
                                           
                                    select 
                                      distinct users_s.user_id,
                                        round(sum(transactions_s.transaction_amount),2) as total_amount
                                        from users_s
                                        join transactions_s
                                          on users_s.user_id =transactions_s.user_id
                                          group by user_id 
                                          order by total_amount desc limit 5;
                                          
                                          
                                          
                                          
				select 
                         
						count( transactions_s.transaction_id) as transaction_count,
							round(sum(transactions_s.transaction_amount),2) as total_amount,
							 monthname(transaction_date) as month_,
                             year(transaction_date) as year_
                             from transactions_s
                             group by transaction_date
                               order by total_amount desc;
                               
                               
                               
                            select 
                                city,
                                   count(transactions_s.transaction_id) as total_transaction
                                   from users_s
                                join transactions_s
                                 on users_s.user_id = transactions_s.user_id
                                 group by city
                                   order by total_transaction desc limit 3;
                                   

                               
                               
                               with revenue_breakdown as ( 
                                   select 
                                   city,
                                      transactions_s.transaction_type,
                                      round(sum(transaction_amount),2) as total_revenue
                                        from transactions_s
										join users_s
									       on transactions_s.user_id = users_s.user_id
											group by 1,2
                                            ) 
                                             select  city,
                                                     transaction_type,
                                            total_revenue,
                                               rank() over (partition by city 
                                                       order by total_revenue desc) as rank_
                                                       from revenue_breakdown;
                                                       
                                                       
                                                       
                                                       
                                                       
                                                       
                                                       
								select 
                                monthname(transaction_date) as month_,
                                   count(transactions_s.transaction_id) as transaction_count
                                  from transactions_s
                                  group by  monthname(transaction_date)
                                   order by transaction_count desc;
                                   
                                   
                                   with pct as(
                                   select 
                                     transactions_s.transaction_type,
                                        count(transaction_id) as total_volume
                                        from transactions_s
                                        group by  transaction_type 
                                        ) 
                                          select 
                                               transaction_type,
                                               total_volume,
                                         round( total_volume * 100.0 / sum(total_volume ) 
                                         over(),2) as share_pct
                                          from pct
                                             order by share_pct desc;
                                             
                                  
                               
                                          
					select 
                        fraud_status,
                count(transactions_s.transaction_id) as transactions, 
                round(sum(transaction_amount),2) as total_revenue
                from transactions_s
                join fraud_flags
                 on transactions_s.transaction_id = fraud_flags.transaction_id
                 where fraud_status = 'fraud';   
                 
                 
                    
                    
                     with city_stat as(
                            select 
                              city,
                              count( transactions_s.transaction_id) as total_city_volume,
                                    sum(case when fraud_status = 'fraud' then 1 else 0
                                      end )as fraud_count 
                                      from users_s
                                      join transactions_s
                                         on users_s.user_id = transactions_s.user_id
                                         join fraud_flags
                                         on transactions_s.transaction_id = fraud_flags.transaction_id
                                         group by  city
                                         ) 
                                         select  
                                          city,
                                          total_city_volume,
                                           fraud_count,
                                          round (fraud_count * 100.0 / total_city_volume ,2) as fraud_pct
                                           from city_stat
                                           order by fraud_count desc;
                        
						
                                  with rate as (         
                             select 
                                 transaction_type, 
                                  count( transactions_s.transaction_id) as total_volume,
                                    sum(case when fraud_status = 'fraud' then 1 else 0
                                      end )as fraud_count 
                                       from transactions_s
                                         join fraud_flags
                                         on transactions_s.transaction_id = fraud_flags.transaction_id
                                         group by transaction_type 
                                         )
								select 
								transaction_type,
                                total_volume,
                                fraud_count,
							round (fraud_count * 100.0 / total_volume ,2) as fraud_pct
                                   from rate 
                                   order by fraud_pct desc limit 1;
                                          
					
                                           
                            select 
                                distinct users_s.user_id,
                                 city,
                                 device_type,
                                round(sum(transactions_s.transaction_amount),2) as total_amount
                                from users_s
                                 join transactions_s
                                 on users_s.user_id = transactions_s.user_id
                                 group by 1,2,3
                                   order by total_amount desc limit 10;
                                
                                
	        with user_count as ( 
                        select 
                           distinct users_s.user_id,
                              count(transactions_s.transaction_id) as transaction_count
                               from users_s
                                 join transactions_s
                                 on users_s.user_id = transactions_s.user_id
                                 group by 1
                                   )
                                     select
                                        avg(transaction_count) as avg_transaction_per_user
                                        from user_count
                                        order by avg_transaction_per_user desc;
                                        
                                        
                                        
                       
                       select 
                           device_type,
                             round(avg(transaction_amount),2) as avg_transaction_amount
                             from users_s
                                 join transactions_s
                                 on users_s.user_id = transactions_s.user_id
                                 group by 1
                                    order by avg_transaction_amount desc;
                                 
                               
                               
                        
                        SELECT  count(*) as one_and_done_user_count
                        from ( 
                            select 
                                    users_s.user_id
                           from users_s
                                 join transactions_s
                                 on users_s.user_id = transactions_s.user_id
                                 where year( transaction_date) ='2024'
                                 group by  user_id
                                having count( transaction_id) >= 1 ) as okay; 
                        
            
            
            
                          select 
                          users_s.user_id
                               from users_s
                           left join transactions_
                               on users_s.user_id = transactions_s.user_id
                                where transaction_id is null
                                group by 1;    
			
                                
                                
                                
                          with users as (  
                        select  
                           users_s.user_id,
                              count(transaction_id) as transaction_count
                              from users_s
                             left join transactions_s
                              on users_s.user_id = transactions_s.user_id 
                              group by user_id 
                                ), user_categorytt as (
                                select 
								   user_id,
                                     case 
                                        when transaction_count > 5 then 'champ'
                                           when transaction_count between 1 and 5 
                                             then 'try'
                                             when transaction_count = 0 then 'done'
                                                 else 'regular' end as user_category 
                                                   from users
										) 
                                           select 
                                               user_category,
                                             count(user_id) as user_count 
                                               from user_categorytt
                                                  group by user_category;
                                                  
                                                  
                                    
                                    
                                    
                                    
                                    
                                    select 
                                 count( transaction_id) as transaction_count,
                                          monthname(signup_date) as month_name
								       from users_s
                                         left join transactions_s
                                            on users_s.user_id = transactions_s.user_id
                                            where transaction_id <=1
                                            group by 2
                                           order by month_name desc limit 1;
                                           
                                           
                                           
                                           
                                   with  merchant_count as (
                                       select t.merchant_category,
                                          count(transaction_id) as total_transaction,
                                      round(avg(transaction_amount),2) as avg_count 
                                         from transactions_s as t 
                                            group by 1
                                             ) 
                                               select
                                                merchant_category,
                                               total_transaction,
                                               avg_count,
                                               rank() over( order by total_transaction desc )
                                               as category_rank
                                                   from  merchant_count;
                                                   
                                                   
                              
                              
                              select 
                                 merchant_category,
                                   device_type,
                                      count(u.user_id) as user_count
                                      from users_s as u
                                      join transactions_s as t
                                      on u.user_id = t.user_id
                                      group by 1,2
                                        order by user_count desc;
                                      
									
                                      
                              
                              with user_count as (
                                 select 
                                merchant_category,
                                   device_type,
                                      count(u.user_id) as user_count
                                      from users_s as u
                                      join transactions_s as t
                                      on u.user_id = t.user_id
                                      group by 1,2
                                      ), ranked as (
                                        select 
                                            merchant_category,
								  device_type,
                                  user_count,
                                   row_number() over(partition by merchant_category
                                    order by user_count desc ) as ranked_cat 
                                     from user_count
                                     ) 
                                        select * 
                                           from ranked 
								       where ranked_cat = 1;
                                       
                                       
                                       
                                       
                                  with fraud_scorecard as (     
                                   select 
                                    merchant_category,
                                     round(sum(t.transaction_amount),2) as total_transaction,
								 count(u.user_id) as total_volume,
                                 round(avg(t.transaction_amount),2) as avg_transaction,
                                 count(f.fraud_status) as fraud_count
                                  from users_s as u
                                  join transactions_s as t
                                  on u.user_id = t.user_id
                                  join fraud_flags as f 
                                    on t.transaction_id = f.transaction_id
                                    where fraud_status = 'fraud'
                                    group by  1
                                    )
                                      select *,
                                 (fraud_count *100 / total_transaction)
                                    as fraud_rate
                                    from fraud_scorecard ;	
                                        
                                         
                               with base_data as (
                                 select 
                                   merchant_category,
                                     count(t.transaction_id) as total_volume,
                                      round(avg(t.transaction_amount),2) as avg_transaction,
                                 sum(case
                                      when fraud_status = 'fraud' then 1
                                       else 0 end) as fraud_count,
                                        round(sum(t.transaction_amount),2) as total_transaction
                                     from transactions_s as t
                                     left join fraud_flags as f
                                     on t.transaction_id = f.transaction_id
                                     group by 1
                                     )
                                      select *,
                                        round((fraud_count *100)/ total_volume,2) as fraud_rate,
                                        round(total_transaction / total_volume,2) as avg_ticket_size
                                        from base_data
                                        order by fraud_rate desc;
                                     
								  
                                 
                                 
                                 
                                 with category_performance as(
                               select 
                                  merchant_category,
                                    round(sum(t.transaction_amount),2) as total_revenue,
                                    sum(case 
                                            when fraud_status = 'fraud' then 1
                                             else 0 end) as fraud_count
                                             from fraud_flags as f
                                             left join transactions_s as t
									on f.transaction_id = t.transaction_id
                                     group by 1
                                     )
                                       select 
                                            merchant_category,
                                              total_revenue,
                                               fraud_count,
										round(total_revenue / nullif( fraud_count,0),2)
                                          as revenue_per_fraud_case
                                          from category_performance
                                          order by revenue_per_fraud_case desc;
                                       
                                       
                                          
                                    
                                   
                                     
                                     
                                       
                                         
						
                                     
                                             
                                       
                                    
                                     
                                     
                                     
                                      
                                      
                                      
                                      
							      
                                               
                                                  
                                         
                                             
                                            
								     
                                          
                                             
                                               
                                   
                                
                                
                                      
						
                           
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                               
                               
                               
                               
                               
                               
                               
                               