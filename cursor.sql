delimiter $$
create procedure `ListanomProducto`(
	inout nomProductolist varchar (5000)
)
begin 
	declare finish integer default 0;
	declare nombreP varchar(100) default " ";
    
    
	declare curNombredelproducto 
		CURSOR for
			select nombreProducto from producto;
	
    declare continue handler 
		for not found set finish =1;
	
    open curNombredelproducto;
    getnombreProducto: loop
		fetch curNombredelproducto into nombreP;
        if finish = 1 then 
			leave getnombreProducto;
		end if;
        
        set nomProductolist = concat(nombreP,";",nomProductolist);
        end loop getnombreProducto;
        close curNombredelproducto;
end $$

set @nomProductolist = " ";
call createnomProductolist(@nomProductolist);
SELECT @nomProductolist;
