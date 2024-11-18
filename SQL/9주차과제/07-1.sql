select cast('2020-10-20 12:35:29.123' as datetime) as 'datetime';
select cast('2020-10-20 12:35:29.1234567 +12:15' as datetime2(7)) as 'datetime2';
select cast('2020-10-20 12:35:29.1234567 +12:15' as date) as 'date';
select cast('2020-10-20 12:35:29.1234567 +12:15' as time(7)) as 'time';
select cast('2020-10-20 12:35:29.1234567 +12:15' as datetimeoffset(7)) as 'datetimeoffset';
select cast('2020-10-20 12:35:29.123' as smalldatetime) as 'smalldatetime';