<h1>resourceGroup-Module</h1>


<h2>Description</h2>

<p></p>

<h2>Resources</h2>

<table>
    <tr>
        <th>Resource Meta Type</th>
        <th>Resource Provider Type</th>
        <th>Resource Name</th>
    </tr>
        <tr>
        <td>resources</td>
        <td>
            <a href="https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group">azurerm_resource_group</a>
        </td>
        <td>main</td>
    </tr>
</table>



<h2>Variables</h2>

<h4>Basic variables</h4>

<table>
    <tr>
        <th>Name</th>
        <th>Type</th>
        <th>Required</th>
        <th>Description</th>
    </tr>
        <tr>
        <td>location</td>
        <td>string</td>
        <td>Required</td>
        <td>The common location for resource deployment.</td>
    </tr>
    <tr>
        <td>tags</td>
        <td>map(string)</td>
        <td>Required</td>
        <td>The common tags used for resource deployment.</td>
    </tr>
</table>


<h4>Module variables</h4>

<table>
    <tr>
        <th>Name</th>
        <th>Type</th>
        <th>Required</th>
        <th>Description</th>
    </tr>
        <tr>
        <td>config_path</td>
        <td>string</td>
        <td>Required</td>
        <td>The path where all configurations for this resource group are stored.</td>
    </tr>
    <tr>
        <td>naming</td>
        <td>map(any)</td>
        <td>Required</td>
        <td>The parameters to use for naming. Use 'override' to override the naming generation.</td>
    </tr>
    <tr>
        <td>naming_convention</td>
        <td>string</td>
        <td>Optional</td>
        <td>The naming convention to use for naming.</td>
    </tr>
    <tr>
        <td>naming_schema</td>
        <td>Complex Object</td>
        <td>Optional</td>
        <td>The schema to use for naming.</td>
    </tr>
</table>



<h2>Outputs</h2>

<h4>Module outputs</h4>

<table>
    <tr>
        <th>Name</th>
        <th>Description</th>
    </tr>
        <tr>
        <td>id</td>
        <td>(undefined)</td>
    </tr>
    <tr>
        <td>name</td>
        <td>(undefined)</td>
    </tr>
    <tr>
        <td>naming_ref</td>
        <td>(undefined)</td>
    </tr>
    <tr>
        <td>config_path</td>
        <td>(undefined)</td>
    </tr>
</table>
