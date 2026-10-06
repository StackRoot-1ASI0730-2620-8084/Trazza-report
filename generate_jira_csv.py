import csv

input_file = '/Users/gabrielpenaranda/GabrielP/IngSoftware/Ciclo2026-02/Desarrollo-de-aplicaciones-web/StackRoot-report/report/31-user-stories.md'
output_file = '/Users/gabrielpenaranda/GabrielP/IngSoftware/Ciclo2026-02/Desarrollo-de-aplicaciones-web/StackRoot-report/trazza-jira-backlog.csv'

with open(input_file, 'r', encoding='utf-8') as f:
    lines = f.readlines()

epics = {}
stories = []

for line in lines:
    if line.startswith('| Epic | **EP'):
        parts = line.split('|')
        epic_id = parts[2].strip().replace('**', '')
        title = parts[3].strip()
        description = parts[4].strip()
        epics[epic_id] = {
            'Summary': title,
            'Description': description
        }
    elif line.startswith('| Story | **US'):
        parts = line.split('|')
        story_id = parts[2].strip().replace('**', '')
        title = parts[3].strip()
        description = parts[4].strip()
        acceptance_criteria = parts[5].strip().replace('<br>', '\n')
        epic_link_id = parts[6].strip()
        
        # Estimate points (same logic as before)
        points = 3
        lower_title = title.lower()
        if 'api' in lower_title or 'restful' in lower_title:
            points = 5
        elif 'landing page' in lower_title:
            points = 2
        elif 'monitoreo' in lower_title or 'tiempo real' in lower_title or 'gps' in lower_title or 'vivo' in lower_title or 'desvío' in lower_title:
            points = 8
        elif 'pago' in lower_title or 'compensación' in lower_title or 'chat' in lower_title or 'kyc' in lower_title:
            points = 8
        elif 'registro' in lower_title or 'inicio de sesión' in lower_title:
            points = 3
        elif 'calificación' in lower_title or 'reportar' in lower_title:
            points = 2
        else:
            points = 5
            
        full_desc = f"{description}\n\nh3. Criterios de Aceptación:\n{acceptance_criteria}"
        
        stories.append({
            'Summary': f"{story_id}: {title}",
            'Description': full_desc,
            'Story Points': points,
            'Epic Name Link': epics.get(epic_link_id, {}).get('Summary', '')
        })

with open(output_file, 'w', encoding='utf-8', newline='') as f:
    writer = csv.writer(f)
    # Header
    writer.writerow(['Issue Type', 'Summary', 'Description', 'Story Points', 'Epic Name', 'Epic Link'])
    
    # Write Epics
    for epic_id, epic_data in epics.items():
        writer.writerow(['Epic', epic_data['Summary'], epic_data['Description'], '', epic_data['Summary'], ''])
        
    # Write Stories
    for story in stories:
        writer.writerow(['Story', story['Summary'], story['Description'], story['Story Points'], '', story['Epic Name Link']])

print(f"Generated CSV with {len(epics)} Epics and {len(stories)} Stories at: {output_file}")
