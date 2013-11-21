import sys
import boto
from boto.route53.record import ResourceRecordSets

if len(sys.argv) < 4:
  print "%s <ZONEID> <dns name> <new_ip>" % sys.argv[0]
  quit()

zone_id = sys.argv[1]
dns_name = sys.argv[2]
new_ip = sys.argv[3]

conn = boto.connect_route53()
rr_sets = conn.get_all_rrsets(zone_id,"A",dns_name);

changes = ResourceRecordSets(conn, zone_id)
if len(rr_sets) > 0 and rr_sets[0].name == dns_name:
  change1 = changes.add_change("DELETE",dns_name,"A",rr_sets[0].ttl)
  change1.add_value(rr_sets[0].resource_records[0])
change2 = changes.add_change("CREATE",dns_name,"A",300)
change2.add_value(new_ip)
changes.commit()
