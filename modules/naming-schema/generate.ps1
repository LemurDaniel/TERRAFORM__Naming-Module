

function ConvertFrom-HtmlTable {
    param (
        [System.String]$htmlTable
    )


    $Entries = @()

    $rows = [regex]::Matches($htmlTable, '<tr\b[\s\S]*?</tr>')
    # Skips the Header Row
    | Select-Object -Skip 1 
    
    foreach ($row in $rows) {
        $columns = [regex]::Matches($row.Value, '<td>[\s\S]*?</td>')

        $abbreviation = [regex]::Match($columns[2].Value, '<code>[\s\S]*?</code>').Value.Replace('<code>', '').Replace('</code>', '').Trim()
        $service = [regex]::Match($columns[1].Value, '<code>[\s\S]*?</code>').Value.Replace('<code>', '').Replace('</code>', '').Trim()
        $kind = [regex]::Match($columns[1].Value, 'kind:[\s\S]*?</code>').Value.Replace('<code>', '').Replace('</code>', '').Trim()

        if ([System.String]::IsNullOrEmpty($kind)) {
            $kind = "default"
        }
        else {
            $kind = $kind.Split(':')[1].Trim()
        }

        $Entries += [PSCustomObject]@{
            Abbreviation = $abbreviation
            Service      = $service
            Kind         = $kind
        }
    }

    return $Entries
}

$sourceUrl = "https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-abbreviations"

$html = Invoke-RestMethod -Uri $sourceUrl

$tables = [regex]::Matches($html, '<table\b[\s\S]*?</table>').Value
$headings = [regex]::Matches($html, '<h2\b[^>]*>(.*?)</h2>')
| ForEach-Object {
    [regex]::Match($_.Value, '>[\s\S]*<').Value.Replace('<', '').Replace('>', '').Trim()
}

$generatedFile = @"

#
# ################################################################################################
# ## This data is generated from: $sourceUrl

Microsoft:

"@

for ($index = 0; $index -lt $headings.Count; $index++) {

    $tableHtml = $tables[$index]
    $heading = $headings[$index]

    $entries = ConvertFrom-HtmlTable -htmlTable $tableHtml

    $generatedFile += "`n`n   " + "### " + $heading + "`n"
    foreach ($entry in $entries) {
        $generatedFile += [System.String]::Format("   {0}::{1}: {2}`n", $entry.Service.Split('.')[1], $entry.Kind, $entry.Abbreviation)
    }

}

$generatedFile | Out-File -NoNewline -FilePath "./config/AzureResourceAbbreviations.yaml" -Encoding UTF8