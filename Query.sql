-- Summary_Received

select  w.id [WarehouseID],
		w.name [Warehouse],
		count(distinct po.vendorid) [VendorCount],
		count(distinct t.purchaseorderid) [POCount] 

from thing t
join PurchaseOrder po on po.id=t.PurchaseOrderId
join warehouse w on w.id=po.sourcingwarehouseid

where po.completedon is not null
and po.CompletedOn>=concat(CAST(GETDATE() as date), ' 00:00  +06:00')
and po.CompletedOn <concat(CAST(GETDATE()+1 as date), ' 00:00  +06:00')
and po.SourcingWarehouseId in (13,28,30,32)
and w.DistributionNetworkId = 1

group by w.id,
         w.name

order by 1 asc