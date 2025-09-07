--First query
select LastName, FirstName, HireDate from Employees where HireDate > '1994-01-01';
--Second query
select CustomerID, COUNT(*) from Orders group by CustomerID;
--Third query
select u.ContactName
from Customers as u
where exists (
  select 1
  from Orders as o
  join OrderDetails as od on od.OrderID = o.OrderID
  join Products as p on p.ProductID = od.ProductID
  where o.CustomerID = u.CustomerID
    and p.ProductName = 'Chai'
);
--Fourth query
Select * from Orders where ShippedDate IS Null;
--Fifth query
with counts as (
    select CustomerID, Count(*) as c
    from Orders
    group by CustomerID
)
Select CustomerID, c
    from counts
    order by c desc
    limit 1;