%%% -*- erlang -*-
%%%
%%% This file is part of hackney released under the Apache 2 license.
%%% See the NOTICE for more information.
%%%
%%% Copyright (c) 2012-2013 Benoît Chesneau <benoitc@e-engura.org>
%%%
-module(hackney_pool_handler).

-include("hackney.hrl").

-type host() :: binary() | string().
-type client() :: #client{}.

%% start a bool handler
-callback start() -> ok | {error, Reason :: any()}.


-callback checkout(Host::host(), Port::integer(),Transport::atom(),
                   Client::client()) ->
    {ok, {Info::any(), CheckingReference::any(), Owner::pid(),
          Transport::atom()}, Socket::inets:socket()}
    | {error, Reason :: any()}.

-callback checkin({Info::any(), CheckingReference::any(), Owner::pid(),
                   Transport::atom()}, Socket::inet:socket()) ->
    ok
    | {error, Reason :: any()}.
