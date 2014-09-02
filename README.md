# weblogic-cookbook

Installs Application server Oracle WebLogic Server 10.3.0.0

## Supported Platforms

- CentOS 6.5

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['weblogic']['remote_installation_file']</tt></td>
    <td>Zip File</td>
    <td>Location of weblogic zip installer</td>
    <td><tt>http://10.0.2.2:8000/V13672-01.zip</tt></td>
  </tr>
</table>
      weblogic:
        remote_installation_file: "http://git-1.athens.intrasoft-intl.private/V13672-01.zip"
## Usage

### weblogic::default

Include `weblogic` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[weblogic::default]"
  ]
}
```

## Contributing

1. Fork the repository on Github
2. Create a named feature branch (i.e. `add-new-recipe`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request

## License and Authors

Author:: YOUR_NAME (<YOUR_EMAIL>)
