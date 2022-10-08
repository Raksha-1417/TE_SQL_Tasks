use TE
create function Fn_Square(@a int)
returns int
as
begin
	return @a * @a
end

select dbo.Fn_Square(4) as Result

select * from demo