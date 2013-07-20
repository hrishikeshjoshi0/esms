<%@ page import="com.esms.model.party.*"%>


<table class="table table-striped table-hover">
	<thead>
		<tr>

			<g:sortableColumn property="title"
				title="${message(code: 'event.title.label', default: 'Title')}" />

			<g:sortableColumn property="location"
				title="${message(code: 'event.location.label', default: 'Location')}" />

			<g:sortableColumn property="description"
				title="${message(code: 'event.description.label', default: 'Description')}" />

			<g:sortableColumn property="recurType"
				title="${message(code: 'event.recurType.label', default: 'Recur Type')}" />

			<g:sortableColumn property="recurInterval"
				title="${message(code: 'event.recurInterval.label', default: 'Recur Interval')}" />

			<g:sortableColumn property="recurUntil"
				title="${message(code: 'event.recurUntil.label', default: 'Recur Until')}" />

			<th></th>
		</tr>
	</thead>
	<tbody>
		<g:each in="${eventInstanceList}" var="eventInstance">
			<tr>

				<td>
					${fieldValue(bean: eventInstance, field: "title")}
				</td>

				<td>
					${fieldValue(bean: eventInstance, field: "location")}
				</td>

				<td>
					${fieldValue(bean: eventInstance, field: "description")}
				</td>

				<td>
					${fieldValue(bean: eventInstance, field: "recurType")}
				</td>

				<td>
					${fieldValue(bean: eventInstance, field: "recurInterval")}
				</td>

				<td><g:formatDate date="${eventInstance.recurUntil}" /></td>

				<td class="link"><g:link action="show" id="${eventInstance.id}"
						class="btn btn-small">Show &raquo;</g:link></td>
			</tr>
		</g:each>
	</tbody>
</table>

<table class="table table-condensed table-striped" data-rowlink="a">
	<thead>
		<tr>
			<th>id</th>
			<th>Summary</th>
			<th>Updated</th>
			<th>Priority</th>
			<th>Status</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>P-23</td>
			<td><a href="javascript:void(0)">Admin should not break if
					URL&hellip;</a></td>
			<td>23/05/2012</td>
			<td class="tac"><span class="label label-important">High</span></td>
			<td>Open</td>
		</tr>
		<tr>
			<td>P-18</td>
			<td><a href="javascript:void(0)">Displaying submenus in
					custom&hellip;</a></td>
			<td>22/05/2012</td>
			<td class="tac"><span class="label label-warning">Medium</span></td>
			<td>Reopen</td>
		</tr>
		<tr>
			<td>P-25</td>
			<td><a href="javascript:void(0)">Featured image on post
					types&hellip;</a></td>
			<td>22/05/2012</td>
			<td class="tac"><span class="label label-success">Low</span></td>
			<td>Updated</td>
		</tr>
		<tr>
			<td>P-10</td>
			<td><a href="javascript:void(0)">Multiple feed fixes
					and&hellip;</a></td>
			<td>17/05/2012</td>
			<td class="tac"><span class="label label-warning">Medium</span></td>
			<td>Open</td>
		</tr>
	</tbody>
</table>