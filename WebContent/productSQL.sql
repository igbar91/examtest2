
create table productLookUp(

code varchar(10) not null,
productname varchar(30) not null,
productsize varchar(40) not null,
productdif varchar(30) not null,
price varchar(30) not null,
primary key(code)
);

select * from productLookUp;

insert into productLookUp values('A001', 'A-1ProductName', '100 x 110 x 50', 'Atype', '\5000');

insert into productLookUp values('A002', 'A-2ProductName', '100 x 110 x 70', 'Atype', '\6000');
insert into productLookUp values('A003', 'A-3ProductName', '100 x 110 x 100', 'Atype', '\7000');

insert into productLookUp values('B001', 'B-1ProductName', '150 x 130 x 50', 'Btype', '\10000');
insert into productLookUp values('B002', 'B-2ProductName', '150 x 130 x 70', 'Btype', '\11000');
insert into productLookUp values('B003', 'B-3ProductName', '150 x 130 x 100', 'Btype', '\13000');

insert into productLookUp values('C001', 'C-1ProductName', '180 x 150 x 50', 'Ctype', '\15000');
insert into productLookUp values('C002', 'C-2ProductName', '180 x 150 x 70', 'Ctype', '\17000');
insert into productLookUp values('C003', 'C-3ProductName', '180 x 150 x 100', 'Ctype', '\20000');

select * from productLookup;


작업지시번호, 수량, 작업시작일
create table WorkCodeLookUp2(

code varchar(30) not null,
workcode varchar(30) not null,
quantity number(20) not null,
startdate varchar(30) not null,
primary key(code)
);

insert into WorkCodeLookUp2 values('A001','2019-0001', '100', '2019-11-01');
insert into WorkCodeLookUp2 values('A002','2019-0002', '150', '2019-11-01');
insert into WorkCodeLookUp2 values('A003','2019-0003', '200', '2019-11-01');

insert into WorkCodeLookUp2 values('B001','2019-0004', '250', '2019-11-02');
insert into WorkCodeLookUp2 values('B002','2019-0005', '100', '2019-11-02');
insert into WorkCodeLookUp2 values('B003','2019-0006', '150', '2019-11-02');

insert into WorkCodeLookUp2 values('C001','2019-0007', '100', '2019-11-03');
insert into WorkCodeLookUp2 values('C002','2019-0008', '150', '2019-11-03');
insert into WorkCodeLookUp2 values('C003','2019-0009', '200', '2019-11-03');

select * from workCodeLookUp2;

select wcl.workcode, pl.code, pl.productname, pl.productsize, pl.productdif, wcl.quantity, wcl.startdate from productLookup pl join WorkCodeLookUp2 wcl on pl.code = wcl.code;



create table workRegister(

workcode varchar(30) not null,
preparestuff varchar(60) not null,
printstep varchar(60) not null,
coatingstep varchar(60) not null,
hapjistep varchar(60) not null,
togetherstep varchar(60) not null,
boxingstep varchar(60) not null,
totalday varchar(60) not null,
totaltime varchar(60) not null,
primary key(workcode)
);

select * from workRegister;



productLookUp pl
WorkCodeLookUp2  wcl
workRegister  wr 

-- 작업공정조회 
select wcl.workcode, wcl.code, pl.productname, wr.printstep, wr.coatingstep, 
wr.hapjistep, wr.togetherstep, wr.boxingstep, wr.totalday, wr.totaltime 
from productLookUp pl, WorkCodeLookUp2 wcl, workRegister wr
where pl.code = wcl.code 
and wcl.workcode = wr.workcode
order by wcl.workcode;
--**************************

select wcl.workcode, wcl.code, wr.printstep from WorkCodeLookUp2 wcl, workRegister wr
where wcl.workcode = wr.workcode;


-- 작업공정수정
select wcl.workcode, wcl.code, pl.productname, wr.printstep, wr.coatingstep, 
wr.hapjistep, wr.togetherstep, wr.boxingstep, wr.totalday, wr.totaltime 
from productLookUp pl, WorkCodeLookUp2 wcl, workRegister wr
where pl.code = wcl.code 
and wcl.workcode = wr.workcode;
--**************************
update workRegister set workcode='2019-0003' where workcode='2018';
