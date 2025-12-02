<h1>naming-schema-Module</h1>


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
            <a href="https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources resources resources/uuid uuid uuid">random_uuid</a>
        </td>
        <td>id</td>
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
        <td>convention</td>
        <td>string</td>
        <td>Required</td>
        <td>The naming convention to use.</td>
    </tr>
    <tr>
        <td>naming</td>
        <td>Complex Object</td>
        <td>Optional</td>
        <td>The default patterns to use for the schema.</td>
    </tr>
    <tr>
        <td>parameter</td>
        <td>map(any)</td>
        <td>Required</td>
        <td>The default parameters to use for the schema.</td>
    </tr>
    <tr>
        <td>abbreviations</td>
        <td>mapmap(map(string))</td>
        <td>Optional</td>
        <td>The abbreviations to use for the schema.</td>
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
        <td>random</td>
        <td>Outputs a random source for unique naming ids.</td>
    </tr>
    <tr>
        <td>index_modifier</td>
        <td>Output the index modifier</td>
    </tr>
    <tr>
        <td>enforce_lower_case</td>
        <td>Output lowercase settings.</td>
    </tr>
    <tr>
        <td>abbreviations</td>
        <td>Output the resources part of the schema.</td>
    </tr>
    <tr>
        <td>mappings</td>
        <td>Output the mappings for resources.</td>
    </tr>
    <tr>
        <td>patterns</td>
        <td>Output the patterns part of the schema.</td>
    </tr>
    <tr>
        <td>default_parameters</td>
        <td>Output the default parameters for the schema.</td>
    </tr>
</table>
