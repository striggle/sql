select * from invoice i
inner join lineitem l
on i.id = l.invoiceid;

select * from product p
inner join lineitem l
on p.id = l.productid;

select * from invoice i
inner join lineitem l
on i.id = l.invoiceid
inner join product p
on p.id = l.productid