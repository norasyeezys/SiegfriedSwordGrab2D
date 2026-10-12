function symbol = sc_translate_intention(intent_str)
% Stand-in for the 1B translation layer. Same contract: language in,
% motor symbol out. Swap the body for the fine-tuned model later.
s = lower(intent_str);
verb = 'wait';
if ~isempty(strfind(s, 'grab')) || ~isempty(strfind(s, 'get')) || ...
   ~isempty(strfind(s, 'take')) || ~isempty(strfind(s, 'reach'))
    verb = 'get';
end
object = 'unknown';
if ~isempty(strfind(s, 'sword'))
    object = 'sword';
end
symbol = struct('verb', verb, 'object', object, 'effector', 'hand');
