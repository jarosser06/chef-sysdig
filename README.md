sysdig Cookbook
===============
Installs sysdig

Requirements
------------

#### packages
- `sysdig`

#### distros
- `rhel`
- `amazon`
- `centos`
- `oracle`
- `fedora`
- `ubuntu`
- `debian`

Attributes
----------
#### sysdig::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['sysdig']['install_method']</tt></td>
    <td>String</td>
    <td>sysdig install method</td>
    <td>binary</td>
  </tr>
  <tr>
    <td><tt>['sysdig']['version']</tt></td>
    <td>String</td>
    <td>sysdig package version</td>
    <td>nil</td>
  </tr>
  <tr>
    <td><tt>['sysdig']['yum']['base_url']</tt></td>
    <td>String</td>
    <td>YUM repo base url</td>
    <td>http://download.draios.com/stable/rpm/$basearch</td>
  </tr>
  <tr>
    <td><tt>['sysdig']['yum']['gpg_key']</tt></td>
    <td>String</td>
    <td>repo key uri</td>
    <td>https://s3.amazonaws.com/download.draios.com/DRAIOS-GPG-KEY.public</td>
  </tr>
  <tr>
    <td><tt>['sysdig']['apt']['uri']</tt></td>
    <td>String</td>
    <td>APT repo uri</td>
    <td>http://download.draios.com/stable/deb</td>
  </tr>
  <tr>
    <td><tt>['sysdig']['apt']['components']</tt></td>
    <td>Array</td>
    <td>Apt repo components</td>
    <td>["stable-$(ARCH)/"]</td>
  </tr>
  <tr>
    <td><tt>['sysdig']['apt']['key']</tt></td>
    <td>String</td>
    <td>repo gpg key uri</td>
    <td>https://s3.amazonaws.com/download.draios.com/DRAIOS-GPG-KEY.public</td>
  </tr>
  <tr>
    <td><tt>['sysdig']['apt']['key_id']</tt></td>
    <td>String</td>
    <td>repo gpg key id</td>
    <td>EC51E8C4</td>
  </tr>
</table>


Usage
-----
#### sysdig::default

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[sysdig]"
  ]
}
```

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
- Author:: Jim Rosser(jarosser06@gmail.com)

```text
copyright (C) 2014-2016 Jim Rosser

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without restriction,
including without limitation the rights to use, copy, modify, merge,
publish, distribute, sublicense, and/or sell copies of the Software,
and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
```
