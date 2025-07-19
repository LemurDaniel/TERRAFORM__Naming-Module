<h1>generator-Module</h1>


<h2>Description</h2>

<p></p>

<h2>Resources</h2>

<table>
    <tr>
        <th>Resource Meta Type</th>
        <th>Resource Provider Type</th>
        <th>Resource Name</th>
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
        <td>Optional</td>
        <td>The location to use for naming.</td>
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
        <td>schema</td>
        <td>Complex Object</td>
        <td>Optional</td>
        <td>The schema to use for naming. If not set, the default schema is used.</td>
    </tr>
    <tr>
        <td>resource</td>
        <td>string</td>
        <td>Required</td>
        <td>The resource to use for naming.</td>
    </tr>
    <tr>
        <td>naming</td>
        <td>map(any)</td>
        <td>Required</td>
        <td>The parameters to use for naming. Use 'override' to override the naming generation.</td>
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
        <td>configuration</td>
        <td>(undefined)</td>
    </tr>
    <tr>
        <td>result</td>
        <td>(undefined)</td>
    </tr>
</table>
