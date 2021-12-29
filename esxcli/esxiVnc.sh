ssh -x root@$1 "cat <<EOF >> /etc/vmware/firewall/vncServer.xml
<ConfigRoot>
  <service>
    <id>vncServer</id>
    <rule id='0000'>
      <direction>inbound</direction>
      <protocol>tcp</protocol>
      <porttype>dst</porttype>
      <port>
        <begin>5900</begin>
        <end>5999</end>
      </port>
    </rule>
    <enabled>true</enabled>
    <required>false</required>
  </service>
</ConfigRoot>
EOF
esxcli network firewall refresh"
